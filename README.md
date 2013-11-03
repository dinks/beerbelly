# Beerbelly [![Code Climate](https://codeclimate.com/github/dinks/beerbelly.png)](https://codeclimate.com/github/dinks/beerbelly)

- An implementation for The [Open Beer Database](http://openbeerdatabase.com)

## Installation

Add this line to your application's Gemfile:

    gem 'beerbelly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beerbelly

## Usage

```
    b = Beerbelly.beers
    b.length # 50
    b.first  # #<Beerbelly::Beer>
```

## Generator

Generate the initializer using the command

`rails generate beerbelly:initializer --access_token=test`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
