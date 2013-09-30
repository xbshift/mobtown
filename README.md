Preparation
===========

In order to set up the Mobtown application from a fresh Git clone, you'll need
to do the following:

1.  git clone into a new directory

2.  generate a 'config/database.yml' file with defaults for sqlite3.

    Sample is included, you may copy/paste that.

3.  create a config/authentication.yml with Stripe API keys.

    Template is included, but you'll need your own API keys

4.  Load schema with 'rake db:schema load'.

    config/routes.rb references 'Category' which will try a table load before the migrations can successfully occur.  As of now, you'll need to comment lines 22-24 in order to load the schema, then uncomment them.

5.  Run it.  'rails s' or whatever.


Examples
========

config/database.yml
-------------------

    development:
        adapter:  sqlite3
        database: db/development.sqlite3
        pool:     5

config/authentication.yml
-------------------------

    stripe:
        pk_test:  pk_test_your_key_here_abcdefghij
        sk_test:  sk_test_your_key_here_abcdefghij
