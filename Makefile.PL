use 5.006;

use ExtUtils::MakeMaker;

my %args = (
    NAME              => 'Digest::Trivial',
    VERSION_FROM      => 'lib/Digest/Trivial.pm',
    ABSTRACT_FROM     => 'lib/Digest/Trivial.pm',
    PREREQ_PM         => { },
    MIN_PERL_VERSION  =>  5.006,
    AUTHOR            => 'Abigail <abigail@abigail.be>',
    LICENSE           => 'mit',
    META_MERGE        => {
        build_requires   => {'Test::More' => 0},
        resources        => {
            repository   => 'git://github.com/Abigail/Digest--Trivial.git',
        },
        keywords         => [qw [ ]],
    },
);

my %filter = (
    MIN_PERL_VERSION     => '6.48',
    LICENSE              => '6.48',
    META_MERGE           => '6.46',
    AUTHOR               => '6.07',
    ABSTRACT_FROM        => '6.07',
);

delete $args {$_} for grep {defined $filter {$_} &&
                            $ExtUtils::MakeMaker::VERSION lt $filter {$_}}
                            keys %args;


WriteMakefile %args;

__END__
