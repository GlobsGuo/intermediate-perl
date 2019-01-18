#!/usr/bin/perl

use parent qw{ MyDate };

sub UNIVERSAL::debug {
	my $now = localtime;
	print "$now\n";
	shift;
	my $msg = shift;
	print $msg;
}

print MyDate->day;
print MyDate->month;

print MyDate->debug('test');
print MyData->debug('agian');

