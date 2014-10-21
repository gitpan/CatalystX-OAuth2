package CatalystX::OAuth2::Grant;
use Moose::Role;

with 'CatalystX::OAuth2';

# ABSTRACT: A role for building oauth2 grant objects

requires 'next_action_uri';

has response_type => ( is => 'ro', required  => 1 );
has client_id     => ( is => 'ro', required  => 1 );
has scope         => ( is => 'ro', predicate => 'has_scope' );
has state         => ( is => 'ro', predicate => 'has_state' );

around _params => sub {
  my $orig = shift;
  return $orig->(@_), qw(response_type scope state client_id)
};

1;

__END__
=pod

=head1 NAME

CatalystX::OAuth2::Grant - A role for building oauth2 grant objects

=head1 VERSION

version 0.001001

=head1 AUTHOR

Eden Cardim <edencardim@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Suretec Systems.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

