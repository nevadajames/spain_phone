# SpainPhone

A gem for validating Spanish telephone numbers. Check if a number is valid, type (fixed, landline)
and get area code and provinces for landlines.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spain_phone'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spain_phone

## Usage

Create a new SpainPhone::Phone object passing a the telephone number as a string in a single argument
without the country code.

```ruby 
phone = SpainPhone::Phone.new('936546515')

phone.valid? => true

phone.phone_type => 'landline'

phone.province => :Barcelona

phone.country_code => '+34'

phone.international => '+34936546515'

phone.phone_number => '936546515'
``` 

##### Available phone types
- landline
- mobile
- toll-free
- premium
 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nevadajames/spain_phone.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
