# Hashtring

A Hashstring is an object that I wanted to experiment with. I was annoyed that i18n translations don't have a nice way of nesting under logical trees.

For example, given:

```yaml
# en.yml

reports:
  marketing: Marketing Reports
  sales: Sales Reports
```

Trying to call `I18n.t(:reports)` returns the hash of marketing and sales with their values. The solution would be to have two keys: an actual name and a namespace:

```yaml
# en.yml

reports: Reports
report_types:
  marketing: Marketing Reports
  sales: Sales Reports
```

I wanted to experiment with a pattern that wouldn't require sacrifice. Enter the Hashtring:

```ruby
reports = "Reports" ** {
  marketing: "Marketing Reports",
  sales: "Sales Reports"
}

puts reports # "Reports"
puts reports.marketing # "Marketing Reports"
```

Sure, it may not be entirely practical, and it probably doesn't solve any *real* problems, but it was something I wanted to play around with.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hashtring'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hashtring

## Usage

To create a Hashtring, simply call the `#**` method on a string and give it a hash.

```ruby
"label" ** {
  key1: "value1",
  key2: "value2"
}
```

One-liner:

```ruby
"label" ** key: "value"
```

You can even nest Hashtrings:

```ruby
orders = "Orders" ** {
  line_items: "Line Items",
  additional_charges: "Summary" ** {
    tax: "NYS Tax",
    shipping: "UPS Shipping"
  }
}
```

Call up values just like you would with a normal hash, but root nodes can be output as strings.

```ruby
puts orders # orders
puts orders[:line_items] # "Line Items"
puts orders[:additional_charges] # "Summary"
puts orders[:additional_charges][:tax] # "NYS Tax"
```

For fun, I leveraged method_missing to give an i18n-like syntax

```ruby
puts orders.line_items # "Line Items"
puts orders.additional_charges.tax # "NYS Tax"
```

## Contributing

1. Fork it ( https://github.com/KyleMacey/Hashtring/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
