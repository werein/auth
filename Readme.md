# Auth

Is ProjectApp engine with user managment and authorization. It supports multiple roles and multiple authorization frameworks.

## Installation

1. Include gem to the `Gemfile`
```ruby
gem 'auth', '~> 1.0', git: 'git@bitbucket.org:werein/auth.git'
```
2. Mount it like Rails engine
```ruby
mount Auth::Engine => '/auth'
```
3. Install engine
```
rails g auth:install
```

## Configuration
Engine configuration can be found in initializers `app/config/initializers/auth.yml`.

```yaml
# Twitter
twitter_key: 'twitter_key'
twitter_secret: 'twitter_secret'

# Facebook
facebook_key: 'facebook_key'
facebook_secret: 'facebook_secret'
```
## Development

In development environment is created user with Administrator abilities `We're in` with email `info@imin.cz` when is gem installed and doesn't support Twitter or Facebook authentication.

## Abilities

As default are defined 2 abilities. They can be used in whole app or engine. Feel free to create new one, when you need it.

1. Admin
2. User

## Authorization

Auth support multiple authorizations for single user. For authorization is used Devise and OmniAuth.

**Currently supports**

* Email authorization
* Twitter
* Facebook

## 3rd gems

Auth is dependent on these gems

* devise
* cancancan
* omniauth
* omniauth-twitter
* omniauth-facebook