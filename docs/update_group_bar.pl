use strict;
use warnings;

my $p1_url   = "https://github.com/phorton1";
my $tb_url   = "https://github.com/phorton1/Arduino-boat-teensyBoat/blob/master/docs/readme.md";
my $app_url  = "https://github.com/phorton1/base-apps-teensyBoat/blob/master/docs/readme.md";
my $lib_url  = "https://github.com/phorton1/Arduino-libraries-Boat/blob/master/docs/readme.md";
my $esp_url  = "https://github.com/phorton1/Arduino-boat-tbESP32/blob/master/docs/readme.md";
my $wind_url = "https://github.com/phorton1/Arduino-boat-teensyWind/blob/master/docs/readme.md";
my $gps_url  = "https://github.com/phorton1/Arduino-boat-teensyGPS/blob/master/docs/readme.md";

# Files with existing group bars -- do label replacements + append teensyGPS
my @std_files = (
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
);

sub slurp {
    my ($path) = @_;
    open(my $fh, '<:utf8', $path) or die "Cannot open $path: $!";
    my $c = do { local $/; <$fh> };
    close $fh;
    return $c;
}

sub splat {
    my ($path, $c) = @_;
    open(my $fh, '>:utf8', $path) or die "Cannot write $path: $!";
    print $fh $c;
    close $fh;
}

for my $path (@std_files) {
    my $c = slurp($path);

    # Label replacements (within group bar lines)
    $c =~ s/Sketch & Device/teensyBoat Firmware/g;
    $c =~ s/wxPerl App/teensyBoat App/g;
    $c =~ s/\bArduino Library\b/Boat Library/g;
    $c =~ s/ESP32 Wifi Bridge/tbESP32 WiFi/g;
    $c =~ s/ST50 Wind Tester/teensyWind Tester/g;

    # Append teensyGPS after the teensyWind Tester entry (linked or unlinked)
    # The last entry has no trailing " --", so we add it, then the new GPS line
    my $wind_pat = qr/\Q$wind_url\E/;
    my $gps_entry = "**[teensyGPS]($gps_url)**";
    $c =~ s{(\*\*(?:\[teensyWind Tester\]\($wind_pat\)|teensyWind Tester)\*\*)(\r?\n)}{$1 --$2$gps_entry$2};

    splat($path, $c);
    print "Updated: $path\n";
}

# teensyGPS readme: expand the lone phorton1 line into the full group bar
my $gps_path = "C:/src/Arduino/boat/teensyGPS/docs/readme.md";
my $c = slurp($gps_path);

# Detect line ending
my $nl = ($c =~ /\r\n/) ? "\r\n" : "\n";

my $old_bar = "**[phorton1]($p1_url)**";
my $new_bar = join($nl,
    "**[phorton1]($p1_url)** --",
    "**[teensyBoat Firmware]($tb_url)** --",
    "**[teensyBoat App]($app_url)** --",
    "**[Boat Library]($lib_url)** --",
    "**[tbESP32 WiFi]($esp_url)** --",
    "**[teensyWind Tester]($wind_url)** --",
    "**teensyGPS**",
);

$c =~ s/\Q$old_bar\E/$new_bar/;

splat($gps_path, $c);
print "Updated: $gps_path\n";

print "Done.\n";
