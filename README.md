# challah-facebook

`challah-facebook` is an extension to the [Challah](http://github.com/jdtornow/challah) gem that allows users to register and authenticate with the Facebook graph API (Facebook Connect.)

## Requirements

* Ruby 1.9.2+
* Bundler
* Rails 3.1+
* Challah Gem 0.9+

## Installation

    gem install challah
    gem install challah-facebook

Or, in your `Gemfile`

    gem 'challah', '>= 0.9'
    gem 'challah-facebook'

## Full documentation

Documentation is available at: [http://rubydoc.info/gems/challah-rolls](http://rubydoc.info/gems/challah-facebook/frames)

### Issues

If you have any issues or find bugs running `challah-facebook`, please [report them on Github](https://github.com/jdtornow/challah-facebook/issues). While most functions should be stable, Challah is still in its infancy and certain issues may be present.

### Testing

`challah-facebook` is tested using Test Unit, Shoulda and Mocha. To run the test suite, `bundle install` then run:

```bash
rake test
```

## License

`challah-facebook` is released under the [MIT license](http://www.opensource.org/licenses/MIT)

Contributions and pull-requests are more than welcome.
