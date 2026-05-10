use strict;
use warnings;

my @files = (
    "C:/src/Arduino/boat/teensyBoat/docs/readme.md",
    "C:/base/apps/teensyBoat/docs/readme.md",
    "C:/base/apps/teensyBoat/docs/architecture.md",
    "C:/base/apps/teensyBoat/docs/user_interface.md",
    "C:/base/apps/teensyBoat/docs/integration.md",
    "C:/src/Arduino/libraries/Boat/docs/readme.md",
    "C:/src/Arduino/libraries/Boat/docs/architecture.md",
    "C:/src/Arduino/libraries/Boat/docs/boatSimulator.md",
    "C:/src/Arduino/libraries/Boat/docs/instSimulator.md",
    "C:/src/Arduino/libraries/Boat/docs/pinouts.md",
    "C:/src/Arduino/libraries/Boat/docs/ST50_testing.md",
    "C:/src/Arduino/boat/tbESP32/docs/readme.md",
    "C:/src/Arduino/boat/teensyWind/docs/readme.md",
    "C:/src/Arduino/boat/teensyGPS/docs/readme.md",
);

my $old = '**[phorton1](https://github.com/phorton1)**';
my $new = 'repos: **[phorton1](https://github.com/phorton1)**';

for my $path (@files) {
    open(my $fh, '<:raw', $path) or die "Cannot open $path: $!";
    my $c = do { local $/; <$fh> };
    close $fh;

    my $orig = $c;
    $c =~ s/\Q$old\E/$new/;
    my $status = ($orig ne $c) ? "fixed" : "unchanged";

    open(my $out, '>:raw', $path) or die "Cannot write $path: $!";
    print $out $c;
    close $out;
    print "$status: $path\n";
}

print "Done.\n";
