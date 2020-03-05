package pfappserver::Form::Field::FilterCondition;

=head1 NAME

pfappserver::Form::Field::FilterCondition -

=head1 DESCRIPTION

pfappserver::Form::Field::FilterCondition

=cut

use strict;
use warnings;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';
with 'pfappserver::Base::Form::Role::Help';


=head2 name

Name

=cut

has_field 'field' => (
    type     => 'Text',
    label    => 'Field',
    default  => 'and',
);

has_field 'value' => (
    type     => 'Text',
    label    => 'Value',
);


has_field 'op' => (
    type     => 'Select',
    label    => 'Value',
    required => 1,
    options  => [
        (
            map {
                (
                    { label => $_, value => $_, requires => ['values'] },
                    {
                        label    => "not_$_",
                        value    => "not_$_",
                        requires => ['values']
                    }
                  )
            } qw( and or )
        ),
        (
            map {
                (
                    { label => $_, value => $_, requires => [qw(value field)] },
                    {
                        label    => "not_$_",
                        value    => "not_$_",
                        requires => [qw(value field)]
                    }
                  )
              } qw(
              contains
              includes
              defined
              regex
              starts_with
              ends_with
              equals
              fingerbank::device_is_a
              date_is_before
              date_is_after
              )
        ),
        (
            map {
                (
                    { label => $_, value => $_, requires => [qw(value)] },
                    {
                        label    => "not_$_",
                        value    => "not_$_",
                        requires => [qw(value)]
                    }
                  )
              } qw( time_period)
        )
    ],
);

has_field values => (
    type => 'Repeatable',
    default_method => sub { [] },
);

has_field 'values.contains' => (
    type => 'Nested',
);

=head1 AUTHOR

Inverse inc. <info@inverse.ca>

=head1 COPYRIGHT

Copyright (C) 2005-2020 Inverse inc.

=head1 LICENSE

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
USA.

=cut

1;
