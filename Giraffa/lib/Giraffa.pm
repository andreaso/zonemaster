package Giraffa v0.0.1;

use 5.014002;
use Moose;

use Giraffa::Nameserver;
use Giraffa::Logger;
use Giraffa::Config;
use Giraffa::Zone;
use Giraffa::Test;

our $logger;
our $config;

sub logger {
    return $logger //= Giraffa::Logger->new;
}

sub config {
    return $config //= Giraffa::Config->new;
}

sub ns {
    my ( $class, $name, $address ) = @_;

    return Giraffa::Nameserver->new( { name => $name, address => $address } );
}

sub zone {
    my ( $class, $name ) = @_;

    return Giraffa::Zone->new({ name => $name });
}

sub test_zone {
    my ( $class, $zname ) = @_;

    return Giraffa::Test->run_all_for($class->zone($zname));
}

=head1 NAME

Giraffa - A tool to check the quality of a DNS zone

=head1 SYNOPSIS

    my @results = Giraffa->test_zone('iis.se')

=head1 METHODS

=over

=item test_zone($name)

Runs all available tests and returns a list of L<Giraffa::Logger::Entry> objects.

=item zone($name)

Returns a L<Giraffa::Zone> object for the given name.

=item ns($name, $address)

Returns a L<Giraffa::Nameserver> object for the given name and address.

=item config()

Returns the global L<Giraffa::Config> object.

=item logger()

Returns the global L<Giraffa::Logger> object.

=back

=head1 AUTHOR

Calle Dybedahl, C<< <calle at init.se> >>

=cut

1;
