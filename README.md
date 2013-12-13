# Fortune

This gem allows you calculate the various statistical parameters and values.

Main features of the library are:
* Work with probabilities
* Random selection of events from the list
* Calculation of odds
* The transition from odds to probability and back
* Combinatorics (permutation, accommodation, combinations)

## Requirements

ruby 1.9 or higher

## Installation

Add this line to your application's Gemfile:

    gem 'fortune'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fortune

## Usage

#### For Hash

Recalculation of the key values to probability, assuming that P = 1

    {:a => 1, :b => 2, :c => 3}.to_p => {:a=>0.16666666666666666, :b=>0.3333333333333333, :c=>0.5}

Select random key by value weights

    {:a => 1, :b => 2, :c => 3}.choose => return :c with 50% probability, :a ~ 16%, :b ~ 33%

Choose from set by value weights

    {[:a, :b, :c] => 1, [:d] => 3}.choose_set => return :d with 75% probability


#### Probability

    p = Fortune::P.new(:m => 1, :n => 10)
    p = Fortune::P.new(1, 10)
    p = Fortune::P.new(0.1)

    p + p => #<Fortune::P:0x0000000225e890 @p=0.2>
    p * p => #<Fortune::P:0x000000022602a8 @p=0.010000000000000002>

    p.to_percent => 10.0

    p.odds.to_s => "1:9.0 on_win (p: 10.00%)"

#### Addon Class Methods

`Math.factorial(n)`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Authors

Personal blog author: [Malykh Oleg](http://es0.ru/) - blog in russian
