#!/usr/bin/perl
use strict;
use Getopt::Std ;
our ($opt_h, $opt_f, $opt_F, $opt_s, $opt_d, $opt_t,$opt_e, $opt_p,$opt_i, $opt_l, $opt_w, $opt_m, $opt_H, $opt_o, $opt_l, $opt_O, $opt_S, $opt_N, $opt_W);
getopts("hf:s:d:t:p:l:w:Fm:HoOS:Ne:W:i:") ;
&usage if $opt_h;
my $maxinterval = defined ($opt_i) ? $opt_i : 10;
$maxinterval *= 1000000;
my $separation = defined ($opt_s)? $opt_s : 1000;
$separation *= 1000;
my $drop = defined ($opt_d) ? $opt_d : 1.5;
my $threshold = defined($opt_t) ? $opt_t: 4.5;
my $flanks = defined($opt_F)?  0 : 1;
my $MaximumDrop = defined($opt_m)? $opt_m : 1;
#print “threshold $threshold flanks $flanks $separation\n”;
my $window = defined ($opt_w) ? $opt_w : 100;
$window *=1000;
my $exclude = defined($opt_e) ? $opt_e : 0;
my $file = $opt_f;
my $wanted = defined( $opt_w) ? $opt_w : 1;
my $outfile = defined ($opt_O)? $opt_O : "Summary.peaks.txt";
my $OutPeaks = {};
my $AllData = OpenFile($file, $wanted);
my $chr = 0;
$_ = $file;
s/^.*\///g;
s/.ready//;
s/.out//;
s/.txt//;
my $phenotype = $_;
foreach my $chr (sort keys %{$AllData}) {
  my $Completed = {};
  my $Data = $AllData->{$chr};
  my $MaxLogP->{logp} = 1000000;
  my $MaxPos = {};
  my $Max = {};
  my $Done = {};
  my $Deleted = $Data;
  my $peakcount = 0;
  #  my $TopPeak =  GetMaxLogP($Data);
  my $good = 1;
  my $TopPeak = {};
  while ($good == 1) {
    $TopPeak =  GetMaxLogP($Data, $exclude, $window);
   # print “top $TopPeak->{pos}, $TopPeak->{logp}, $TopPeak->{score}\n”;
    if ($TopPeak->{score} > 0) {
      my $pos = $TopPeak->{pos};
      delete($Data->{$pos});
      delete($Deleted->{$pos});
    }
   else {
      $good = 0;
    }
  }
  unless ($opt_m) {
    if ($TopPeak->{logp} >= $threshold + 1) {
      $MaximumDrop = $TopPeak->{logp} - $threshold;
    }
  }
  while ($MaxLogP->{logp} >= $threshold ) {
    my $good = 1;
    while ($good == 1) {
      $MaxLogP = GetMaxLogP($Deleted, $exclude, $window);
      if ($MaxLogP->{score} > 0) {
	my $pos = $MaxLogP->{pos};
#	print “score $MaxLogP->{score}, $MaxLogP->{logp},  at  $MaxLogP->{pos}\n”;
	delete($Data->{$pos});
	delete($Deleted->{$pos});
      }
     else{
	$good = 0;
      }
    }
    last if (abs($MaxLogP->{logp} - $TopPeak->{logp}) >= $MaximumDrop);
    $peakcount++;
    $Max = FindMax($Deleted, $separation, $drop, $flanks);
    foreach my $pos (keys %{$Max}) {
   #   print “pos $pos $MaxLogP->{logp}  $Max->{$pos}{logp}\n”;
      unless ($MaxLogP->{logp} <= $threshold) {
	my $id = $peakcount . "\t" . $MaxLogP->{logp};
	$Completed->{$chr}{$pos}{$id}{logp} = $Max->{$pos}{logp};
	$MaxPos->{$chr}{$id} = $MaxLogP->{pos};
      }
    }
    my $Done = DeletePeaks($Deleted, $Max, $separation);
    $Deleted = $Done;
  }
  my $Peaks = {};
  my $outfile;
  foreach my $chr  (sort {$a <=> $b } keys %{$Completed}) {
    foreach my $pos  (sort {$a <=> $b } keys %{$Completed->{$chr}}) {
     foreach my $id  (sort {$a <=> $b } keys %{$Completed->{$chr}{$pos}}) {
	my ($peak, $max) = split (/\s+/, $id);
	if ($pos > 0 && $Completed->{$chr}{$pos}{$id}{logp} > 0) {
	  push (@{$Peaks->{$id}},$pos);
	}
      }
   }
  #  $file =~ s/.txt//;
  #  $file =~ s/^.*\///;
    foreach my $id (sort {$a <=> $b } keys %{$Peaks}) {
      my ($peak, $max) = split (/\s+/, $id);
      my @sorted = sort {$a<=>$b} @{$Peaks->{$id}};
      # my $number = $#sorted + 1;
      my $marker = $chr . "-" . $MaxPos->{$chr}{$id};
      unless (abs($sorted[0] - $sorted[$#sorted]) >= $maxinterval) {
	$OutPeaks->{$chr}{$sorted[0]}{data} = "$file\t$chr\t$sorted[0]\t$sorted[$#sorted]\t$marker\t$MaxPos->{$chr}{$id}";
	$OutPeaks->{$chr}{$sorted[0]}{max} = $max;
      }
#      printf “$file\t$chr\t$sorted[0]\t$sorted[$#sorted]\t%3.2f\t$MaxPos->{$chr}{$id}\t$marker\n”, $max;
    }
  }
}
 print "file\tchr\tstart\tstop\tmarker\tmaxpos\tlogp\n";
foreach my $chr  (sort {$a <=> $b } keys %{$OutPeaks} ) {
  foreach my $pos  (sort {$a <=> $b } keys %{$OutPeaks->{$chr}}) {
    print "$OutPeaks->{$chr}{$pos}{data}\t";
    printf "%3.2f\n", $OutPeaks->{$chr}{$pos}{max};
  }
}
  #warn “DONE $outfile\n”;
sub usage {
die "FindMergePeaks.pl -f <file>
file has to have a header with chr, bp and either logp or pval
-s <100> peak separation (in Kb)
-d <1> peak drop off (in logP units)
-t <5> threshold for peak logP to include
-m <1> maximum allowed drop from peak
-i <10> maximum allowed interval for the peak. Default is 10 megabases
option
-e <value> exclude markers above threshold without neighbouring markers (within a window of 100Kb side) less than <value> logP units below
-w <100> window for the exclusion distance (default is 100 Kb>
\n";
}
sub OpenFile {
my $file = @_[0];
my $wanted = @_[1];
my $Data = {};
$_ = $file;
s/^.*\///g;
my $phenotype = $_;
my $Header = {};
open (FILE, $file) || die "Can’t open peaks file $file\n";
my $head = <FILE>;
chomp($head);
my @data = split(/\t/, $head);
for (my $n = 0; $n <= $#data; $n++) {
  $Header->{$data[$n]} = $n;
}
unless (exists ($Header->{'chr'}) && exists ($Header->{'bp'})) {
  die "File header of $file does not contain chr or bp\n";
}
unless (exists ($Header->{'pval'}) || exists ($Header->{'logp'})) {
  die "File header of $file must contain pval or logp\n";
}
#chr	bp	snp	pvalue_fe	pvalue_re	pvalue_re2	pvalue_Q	logp
while (<FILE>) {
  chomp;
  my @data = split;
  my $pos = $data[$Header->{'bp'}];
  my $logp = "NA";
  if (exists ($Header->{'logp'}))  {
    $logp = $data[$Header->{'logp'}];
  }
  elsif (exists($Header->{'pval'})) {
    if ($data[$Header->{'pval'}]  > 0 ) {
      $logp = -1*( log($data[1])/log(10));
    }
  }
  my $chr = $data[$Header->{'chr'}];
$Data->{$chr}{$pos}{logp} = $logp;
$Data->{$chr}{$pos}{chr} = $chr;
$Data->{$chr}{$pos}{phenotype} = $phenotype;
}
return ($Data);
}
sub GetMaxLogP {
  my $Data = @_[0];
  my $exclude = @_[1];
  my $window =  @_[2];
  my $count = 1;
  my $MaxLogP = {};
  my $MaxLogP->{logp} = 0;
  foreach my $pos (sort {$Data->{$b}{logp} <=> $Data->{$a}{logp} } keys %{$Data}) {
    if ($count == 1) {
      $MaxLogP->{logp} = $Data->{$pos}{logp};
      $MaxLogP->{pos} = $pos;
    }
    $count++;
  }
  my $start = $MaxLogP->{pos} - $window;
  my $end =  $MaxLogP->{pos} + $window;
# print “start, $start end $end, window $window\n”;
  my $score = 0;
  my @differences;
  foreach my $pos (sort {$a <=> $b } keys %{$Data}) {
    last if ($pos >= $end);
    if ($pos >= $start) {
	my  $difference = abs($MaxLogP->{logp} - $Data->{$pos}{logp});  	
	  unless ($pos == $MaxLogP->{pos}) {
	    push (@differences, $difference);
#	     print “diff $difference $pos, $Data->{$pos}{logp} \n”;
	  }
    }
  }
  my @sorted = sort (@differences);
  if ($sorted[0] >= $exclude) {
    $score++;
  }
  $MaxLogP->{score} = $score;
  return ($MaxLogP);
}
sub FindMax {
  my $Data = @_[0];
  my $separation = @_[1];
  my $drop = @_[2];
  my $flanks = @_[3];
  my $start = 1;
  my $max = 0;
  my $happy = 0;
  my $position = 0;
  my $Sorted = {};
  my $lastmax = 0;
  my $lastposition = 0;
  my $maxposition = 0;
  my $maxmax = 0;
  my @Ordered;
  my $FindOrdered = {};
  my $n = 0;
  if ($flanks ==1 ) {
    foreach my $pos (sort {$b <=> $a} keys %{$Data}) {
      $Ordered[$n] = $pos;
      $FindOrdered->{$pos} = $n;
      $n++;
    }
  }
  foreach my $pos (sort {$Data->{$b}{logp} <=> $Data->{$a}{logp} } keys %{$Data}) {
    $max = $Data->{$pos}{logp};
    $position = $pos;
    #print “drop $drop separation $separation max $max, lastmax $lastmax  position $position lastposition $position\n”;
    if ($start == 1 ) {
      $Sorted->{$position}{logp} = $max;
      $lastmax = $max;
      $maxmax = $max;
      $maxposition = $position;
      $start++;
      next;
    }
    my $checkdrop = abs($max - $maxmax);
    my $checkposition = abs($position - $maxposition) ;
    #print ” max = $max, maxmax = $maxmax checkdrop $checkdrop at $checkposition drop is $drop\n”;
    if ($checkdrop <= $drop) {
      if ($checkposition <= $separation) {
	$Sorted->{$position}{logp} = $max;
      }
    }
    $lastmax = $max;
    $lastposition = $position;
    $start++;
  }
  #Get flanks
  if ($flanks == 1) {
    my $start;
    my $end;
    my $count = 0;
    foreach my $pos (sort {$a <=> $b } keys %{$Sorted}) {
      $count++;
      if ($count == 1) {
	$start = $pos;
	$end = $pos;
	next;
      }
      else {
	$end = $pos;
      }
    }
    my $beginflank = $Ordered[$FindOrdered->{$start} +1];
    my $endflank = $Ordered[$FindOrdered->{$end} - 1];
    $Sorted->{$beginflank}{logp} = $Data->{$beginflank}{logp};
    $Sorted->{$endflank}{logp} = $Data->{$endflank}{logp};
  }
  return ($Sorted);
}
sub DeletePeaks {
my $Data = @_[0];
my $Peak = @_[1];
my $separation = @_[2];
my $start = 0;
my $end = 0;
my $startpos =0;
my $endpos = 0;
my $Deleted = {};
foreach my $pos (sort {$a <=> $b } keys %{$Peak} ) {
if ($start == 0) {
$startpos = $pos;
$endpos = $pos;
$start++;
next;
}
$endpos = $pos;
}
#print “$startpos\t$endpos\n”;
my $startpos = $startpos - $separation;
my $endpos = $endpos + $separation;
foreach my $pos (sort {$a <=> $b } keys %{$Data} ) {
if ($pos < $startpos) {
$Deleted->{$pos}{logp} = $Data->{$pos}{logp};
next;
}
elsif ($pos > $endpos) {
$Deleted->{$pos}{logp} = $Data->{$pos}{logp};
}
}
return ($Deleted);
}
