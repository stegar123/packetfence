package fingerbank::Schema::Upstream::DHCP6_Enterprise;

use Moose;
use namespace::autoclean;

extends 'fingerbank::Base::Schema::DHCP6_Enterprise';

__PACKAGE__->add_columns(
   "organization",
);

__PACKAGE__->meta->make_immutable;

1;
