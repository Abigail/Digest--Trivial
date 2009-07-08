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
