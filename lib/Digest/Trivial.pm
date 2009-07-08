package Digest::Trivial;

use strict;
use warnings;
no  warnings 'syntax';

use Exporter ();
use AutoLoader;

our @ISA     = qw (Exporter);
our @EXPORT  = qw (trivial_x trivial_s);
our $VERSION = '2009070801';

require XSLoader;
XSLoader::load ('Digest::Trivial', $VERSION);

1;

__END__

=pod

=head1 NAME

Digest::Trivial - Trivial but fast ways to map strings to small integers

=head1 SYNOPSIS

  use Digest::Trivial;

  say trivial_x "hello, world";       #   12
  say trivial_s "hello, world";       #  136

=head1 DESCRIPTION

The module provides 2 methods that take a string as input, and return
an integer (the digest) between 0 and 255 inclusive. The goal is to
provide functions with algorithms, that are I<< fast >>, I<< repeatable
>>, and map to all possible integers in the range roughly evenly. They
aren't cryptically secure; the returned integer is easily guessable,
and it's trivial to create a string that maps to a certain integer.

The following functions are available:

=over 4

=item C<< trivial_x >>

Calculates the digest by C<< xor >>ring the code points, returning the
resulting value. 

=item C<< trivial_s >>

Calculates the digest by adding the code points, returning the
sum module 256.

=back

=head2 Caveats

There are a few things to consider.

=over 4

=item *

Since adding and C<< xor >>ring are symmetric operations, two strings
that only differ by the order in which the characters appear in the
string will be mapped to the same number.

=item *

The functions look at the strings I<< byte >>wise. That is, a string
may be mapped to a different integer depending whether it's UTF-8
encoded or not.

=item *

If there are no non-ASCII characters present in the string, C<< trivial_x >>
will not return an integer above 127. Since C<< xor >>ring a value with
itself returns 0, C<< trivial_x >> effectively takes the digest of the
characters that appear an odd times in the string.

=back

=head2 Exports

By default, C<< Digest::Trivial >> exports both C<< trivial_x >> and
C<< trivial_s >>. Use an explicite (possibly empty) import list if
you want a subset of the default.

=head1 BUGS

If the argument of C<< trivial_s >> or C<< trivial_x >> contains a 
C<< NUL >> byte, only the part of the string preceeding the C<< NUL >>
byte is used to calculate the digest.
