#!/usr/bin/perl -w
use strict;
use Data::Dumper;


#open IN, "/home/tim/jLog-KY4J/RegularLogbook-KY4J.jdb";
open my $fh_log, "<", "RegularLogbook-KY4J.jdb";
my ($line, $c, @logrec, $date, $time, $call, $band, $mode, %log, $qsoinfo);

while ($line = <$fh_log>) {
    chomp($line);
    $line =~ s/^\s+//g;
    @logrec = split(/;/,$line);
    #print Dumper(@logrec);
    ($date, $time, $call, $band, $mode) = @logrec;
    #print "$date $time $call $band $mode \n";
    #Load the hash
    $qsoinfo = "$date $time $band $mode";
    $log{ $call } = $qsoinfo;
    $c++;
}
print "Loaded $c records.\n";

#my ($key, $value);
#while (($key, $value) = each %log) {
#    print "$key $value\n";
#}
#print Dumper(%log);
print $log{'KY4K'} . "\n";

