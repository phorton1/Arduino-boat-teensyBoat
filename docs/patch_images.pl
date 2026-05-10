use strict;
use warnings;

sub patch {
    my ($path, @subs) = @_;
    open(my $fh, '<:raw', $path) or die "Cannot open $path: $!";
    my $c = do { local $/; <$fh> };
    close $fh;
    my $orig = $c;
    for my $sub (@subs) { $sub->(\$c); }
    if ($orig eq $c) { print "UNCHANGED: $path\n"; return; }
    open(my $out, '>:raw', $path) or die "Cannot write $path: $!";
    print $out $c;
    close $out;
    print "Updated:   $path\n";
}

# readme.md: replace the TODO photo placeholder with the linked thumbnail
patch("C:/src/Arduino/boat/teensyBoat/docs/readme.md",
    sub {
        my $c = shift;
        my $img = "[![teensyBoat bench setup](images/tb_desk_setup_resized.jpg)](images/tb_desk_setup.jpg)";
        $$c =~ s{TODO: insert photo of teensyBoat device as installed on boat}{$img};
    }
);

# electronics.md: replace the first "TODO: insert photo of assembled PCB here"
# with the linked PCB thumbnail
patch("C:/src/Arduino/boat/teensyBoat/docs/electronics.md",
    sub {
        my $c = shift;
        my $img = "[![teensyBoat PCB](images/tb_pcb_resized.jpg)](images/tb_pcb.jpg)";
        $$c =~ s{TODO: insert photo of assembled PCB here}{$img};
    }
);

print "Done.\n";
