#!/usr/bin/perl -w
# server
use strict;
use IO::Socket::Multicast;
#use constant DESTINATION => '233.1.1.7:4001';
use constant DESTINATION => '233.4.189.9:4001';
my $sock = IO::Socket::Multicast->new(Proto=>'udp',PeerAddr=>DESTINATION);

while (1) {
    my $message = `date`;
    $message .= "\n" . `hostname -f`;
    $sock->mcast_ttl(20);
    $sock->send($message) || die "Couldn't send: $!";
} 
continue {
    sleep 1;
}
