Social Network
===============

###About
Ruby on Rails app.

*CRUD:* users, messages.

Users can sign up, sign in, add friends, create messages, view friends' messages.
Jquery is used on the 'Send message' feature.  Devise user authenication employed.

##Setup
In your terminal clone this repo:

```console
$ clone https://github.com/rmderfler/social.git
```

Start postgres:

```console
$ postgres
```

Install all dependencies:

```console
$ bundle install
```

Set up the database

```console
$ rake db:create
$ rake db:migrate
```

Start rails server:

```console
$ rails s
```

## Licensing
* MIT