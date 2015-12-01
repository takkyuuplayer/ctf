use common::sense;

my $original
    = 'EBG KVVV vf n fvzcyr yrggre fhofgvghgvba pvcure gung ercynprf n yrggre jvgu gur yrggre KVVV yrggref nsgre vg va gur nycunorg. EBG KVVV vf na rknzcyr bs gur Pnrfne pvcure, qrirybcrq va napvrag Ebzr. Synt vf SYNTFjmtkOWFNZdjkkNH. Vafreg na haqrefpber vzzrqvngryl nsgre SYNT';

#do {
#    say "$_ is " . chr($_);
#    }
#    for 1 .. 122;

sub ceaser {
    my ($orig, $shift) = @_;

    my ($A, $B) = map { chr(($shift + $_ + 26) % 26 + 65) } 0 .. 1;
    my ($a, $b) = map { chr(($shift + $_ + 26) % 26 + 97) } 0 .. 1;

    eval "\$orig =~ tr/A-Za-z/$B-ZA-${A}$b-za-$a/";
    say $@;
    say $orig;

}

ceaser $original, 12;
