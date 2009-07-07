#!/usr/bin/perl

use strict;
use warnings;
no  warnings 'syntax';

use Test::More tests => 257;

BEGIN {
    use_ok 'Digest::Trivial'
};

foreach my $i (0 .. 255) {
    my $str = chr $i;
    is hash ($str), $i, "hash (ord $i) == $i";
}
