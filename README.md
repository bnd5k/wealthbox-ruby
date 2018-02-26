# WealthboxRuby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wealthbox_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wealthbox_ruby

## Usage

### Authentication

Create a new api key for a user

```ruby
response = WealthboxRuby::Client.create_api_token(username: "test@example.com", password: "password123")
token = response['token']
```

### API

Create a new client

```ruby
client = WealthboxRuby::Client.new(access_token: token)
```

#### Contacts

##### Search contacts by name

```ruby
  contacts = client.search_contacts('Jerry')
```

Returns `Array[Wealthbox::Models::Contact]`

##### Get all contacts

```ruby
  contacts = client.contacts
```

Returns `Array[Wealthbox::Models::Contact]`

##### Find contact by id

```ruby
  contact = client.contact(1234)
```

Returns `Wealthbox::Models::Contact`

##### Create contact

```ruby
  contact = client.create_contact(contact_params)
```

Returns `Wealthbox::Models::Contact`

##### Update contact

```ruby
  contact = client.update_contact(contact_params)
```

Returns `Wealthbox::Models::Contact`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/retireupinc/wealthbox-ruby.
