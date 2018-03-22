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

phone.area_code => '936'

phone.country_code => '+34'

phone.international => '+34936546515'

phone.phone_number => '936546515'
``` 

Random phone numbers can also be generated for each type using the Generator class. All the methods from SpainPhone::Phone 
are then available for each generated object.

```ruby 
SpainPhone::Generator.landline 
=> #<SpainPhone::Phone:0x00005636df2b4078 @phone_number="941804356">

SpainPhone::Generator.mobile 
=> #<SpainPhone::Phone:0x00005636df2c3690 @phone_number="727004177">

SpainPhone::Generator.premium 
=> #<SpainPhone::Phone:0x00005636df2ca8f0 @phone_number="902399160">

SpainPhone::Generator.toll_free 
=> <SpainPhone::Phone:0x00005636df2d4530 @phone_number="900968312">
``` 

##### Available phone types
- landline
- mobile
- toll-free
- premium
 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nevadajames/spain_phone.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
