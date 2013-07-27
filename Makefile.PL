use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on it.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    NAME                => 'Dancer::Logger::Syslog',
    AUTHOR              => q{Alexis Sukrieh <sukria@sukria.net>},
    VERSION_FROM        => 'lib/Dancer/Logger/Syslog.pm',
    ABSTRACT            => 'Dancer logger engine for Sys::Syslog',
    'LICENSE'           => 'perl',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More'  => 0,
        'Dancer'      => 1.123,
        'Sys::Syslog' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Dancer-Logger-Syslog-*' },
    ($eumm_version < 6.46
      ? ()
      : ( META_MERGE => {
              resources => {
                  repository => 'https://github.com/PerlDancer/Dancer-Logger-Syslog',
              },
          },
        )
    ),
);
