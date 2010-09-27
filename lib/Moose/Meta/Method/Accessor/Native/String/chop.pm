package Moose::Meta::Method::Accessor::Native::String::chop;

use strict;
use warnings;

our $VERSION = '1.14';
$VERSION = eval $VERSION;
our $AUTHORITY = 'cpan:STEVAN';

use Moose::Role;

with 'Moose::Meta::Method::Accessor::Native::Writer' => {
    -excludes => [
        qw(
            _maximum_arguments
            _inline_optimized_set_new_value
            )
    ]
};

sub _maximum_arguments { 0 }

sub _potential_value {
    my ( $self, $slot_access ) = @_;

    return "( do { my \$val = $slot_access; chop \$val; \$val } )";
}

sub _inline_optimized_set_new_value {
    my ( $self, $inv, $new, $slot_access ) = @_;

    return "chop $slot_access";
}

no Moose::Role;

1;