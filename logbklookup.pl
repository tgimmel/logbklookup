#!/usr/bin/perl -w
use strict;
use Data::Dumper;


#open IN, "/home/tim/jLog-KY4J/RegularLogbook-KY4J.jdb";
open my $fh_log, "<", "RegularLogbook-KY4J.jdb";
my ($line, @logrec, $date, $time, $call, $band, $mode, %log);

while ($line = <$fh_log>) {
    chomp($line);
    $line =~ s/^\s+//;
    @logrec = split(/;/,$line);
    #print Dumper(@logrec);
    ($date, $time, $call, $band, $mode) = @logrec;
    print "$date $time $call $band $mode \n";
    #Load the hash
    %log= {
        $call => "$date $time $band $mode"
    }   
    
}

print "$log{'N9JCA'}\n";

