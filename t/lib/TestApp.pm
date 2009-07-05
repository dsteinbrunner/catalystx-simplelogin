package TestApp;
use Moose;
use namespace::autoclean;

use Catalyst qw/
    Authentication
/;
extends 'Catalyst';

__PACKAGE__->config(
    'Plugin::Authentication' => {
        default => {
            credential => {
                class => 'Password',
                password_field => 'password',
                password_type => 'clear'
            },
            store => {
                class => 'Minimal',
                users => {
                    bob => {
                        password => "s00p3r",
                    },
                    william => {
                        password => "s3cr3t",
                    },
                },
            },
        },
    },
);

__PACKAGE__->setup;

__PACKAGE__->meta->make_immutable;

