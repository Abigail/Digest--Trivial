#!/usr/bin/perl

use strict;
use warnings;
no  warnings 'syntax';

use constant NR_OF_CHARS => 256;
use constant MAX_CHAR    => NR_OF_CHARS - 1;

use Test::More tests => 1 + 2 * NR_OF_CHARS;

BEGIN {
    use_ok 'Digest::Trivial'
};

foreach my $i (0 .. MAX_CHAR) {
    my $str = chr $i;
    is hash ($str), $i, "hash (chr $i) == $i";
}

#
# Double letters cancel out each other
#
foreach my $i (0 .. MAX_CHAR) {
    my $str  = chr $i;
       $str x= 2;
    is hash ($str), 0, "Double chr ($i) is cancelled";
}
