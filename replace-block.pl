#!/usr/bin/perl -w
use strict;

# Replace everything between two two regexes (inclusive).
# The whole file is considered, so the matching block can span multiple lines

# The multi-line matching syntax of sed is (for me) total gibberish
# and having a replacement with newlines was just PITA
# therefore this simple script to replace everything bewteen two 
# regexes by a (possibly) multi-line replacement

if ( @ARGV != 4 ) {
  print "usage: $0 <start-regex> <end-regex> <replacement> <filename>\n";
  exit 1
}

my $START=shift;
my $END=shift;
my $REPLACEMENT=shift;
my $filename=shift;

local $/ = undef;

open INFILE, $filename or die "Could not open file. $!";
my $string =  <INFILE>;
close INFILE;

$string =~ s/$START.*?$END/$REPLACEMENT/sm;

print $string;