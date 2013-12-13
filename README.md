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
    {:a => 1, :b => 2, :c => 3}.to_p => {:a=>0.1666, :b=>0.3333, :c=>0.5}

Select random key by value weights
    {:a => 1, :b => 2, :c => 3}.choose => :c with 50% probability, :a ~ 16%, :b ~ 33%

Choose from set by value weights
    {[:a, :b, :c] => 1, [:d] => 3}.choose_set => :d with 75% probability


#### Probability


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Authors

Personal blog author: [Malykh Oleg](http://es0.ru/) - blog in russian
