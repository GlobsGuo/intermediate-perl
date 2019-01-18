#!/usr/bin/perl
{
	package MyDate;

	use v5.16;
	use Carp qw(croak);


	my %slice_index = qw(day 3 month 4 year 5);
	my @basis = qw(0 0 0 0 1 1900 0 0 0);

	sub AUTOLOAD {
		my @methods = qw(day month year);
		our $AUTOLOAD;
		if ($AUTOLOAD =~ /::(\w+)$/ and grep $1 eq $_, @methods) {
			{
				no strict 'refs';
				my $index = $slice_index{$1};
				*$AUTOLOAD = sub { (localtime)[$index] + $basis[$index] };
			}
			goto &$AUTOLOAD;
		} else {
			croak "Unknown method: $AUTOLOAD";
			return;
		}
	}
}

