#!/usr/bin/perl -w

# Receiver client tester
use lib '/home/heanet/perl5/lib/perl5';

use IO::Socket;
use IO::Socket::Multicast;

$port='4001';
#$group = '233.1.1.6';   #AS1213
$group = '233.4.189.9';   #AS1213
#$group = '233.4.189.8';   #AS1213

my $sock = IO::Socket::Multicast->new(LocalPort=>$port) || die "socket: $!\n";
$sock->mcast_add($group) || die "mcast_add: $!\n";

while (1) {
	my ($message, $peer);
	$peer = recv($sock, $message, 1024, 0) || die "recv: $!\n";
	my ($peerport, $peeraddr) = sockaddr_in($peer);
	print inet_ntoa($peeraddr) . ": $message\n";
}
