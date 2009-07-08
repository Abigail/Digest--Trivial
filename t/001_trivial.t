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

#
# Single character strings.
#
foreach my $i (0 .. MAX_CHAR) {
    my $str = chr $i;
    is trivial_x $str, $i, "trivial_x (chr $i) == $i";
}

foreach my $i (0 .. MAX_CHAR) {
    my $str = chr $i;
    is trivial_s $str, $i, "trivial_s (chr $i) == $i";
}

