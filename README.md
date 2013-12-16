# Fortune

This gem allows you calculate the various statistical parameters and values.

Main features of the library are:
* `P` - Probabilities
* `Odds` - Calculation of odds
* `A`, `Pn`, `C` - Combinatorics (accommodation, permutation, combinations)
* `Event` - Random selection of events from the list

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
```ruby
{:a => 1, :b => 2, :c => 3}.to_p 
# => {:a=>0.16666666666666666, :b=>0.3333333333333333, :c=>0.5}
```
Select random key by value weights
```ruby
{:a => 1, :b => 2, :c => 3}.choose 
# => return :c with 50% probability, :a ~ 16%, :b ~ 33%
```
Choose from set by value weights
```ruby
{[:a, :b, :c] => 1, [:d] => 3}.choose_set 
# => return :d with 75% probability
```

#### Probability

Some methods for P
```ruby
p = Fortune::P.new(:m => 1, :n => 10)
p = Fortune::P.new(1, 10)
p = Fortune::P.new(0.1)
# => #<Fortune::P:0x00000002316df0 @p=0.1>

p + p # => #<Fortune::P:0x0000000225e890 @p=0.2>
p * p # => #<Fortune::P:0x000000022602a8 @p=0.010000000000000002>

p.to_percent # => 10.0

p.odds # => #<Fortune::Odds:0x0000000230ff50 @p=0.1, @s=1, @k=9.0, @type=:on_win>
p.odds.to_s # => "1:9.0 on_win (p: 10.00%)"
```

Check event is occured
```ruby
Fortune::P.is(1,10) # => false (90%)
```
Select random element
```ruby
Fortune::P.n(3) # => 1 or 2 or 3
```
Select random key from array or range by weights ({P.n(key) => weight, ...}, P(sum(weights)) = 1)
```ruby
Fortune::P.n_select(10 => 1, 5 => 1000) # => 4
Fortune::P.n_select((1..10) => 1, (100..200) => 1000) # => 157
Fortune::P.n_select([:a,:b,:c] => 1, [:d,:e] => 1000) # => :d
```

#### Odds
Class for odds calculations
```ruby
odds = Fortune::Odds.new(:win => 5, :lose => 6)
# => #<Fortune::Odds:0x000000026ccf08 @p=0.45454545454545453, @s=5, @k=6, @type=:on_win>
odds_other = Fortune::Odds.new(:s => 5, :k => 7)
# => #<Fortune::Odds:0x00000002706168 @p=0.4166666666666667, @s=5, @k=7, @type=:on_win>
odds > odds_other # => true
odds.variants # => 11
odds.p # => 0.45454545454545453
```
Large values can be simple converted to human view
```ruby
Fortune::Odds.new(:win => 1345, :lose => 3623).to_s # => "1345:3623 on_win (p: 27.07%)"
Fortune::Odds.new(:win => 1345, :lose => 3623).to_human.to_s # => "2:5 on_win (p: 28.57%)"
Fortune::Odds.new(:win => 1345, :lose => 3623).to_human(:k => 5, :fractions => true).to_s # => "1.5:4 on_win (p: 27.27%)"
```
Reverse odds to lose
```ruby
odds = Fortune::Odds.new(:win => 5, :lose => 6)
# => #<Fortune::Odds:0x00000002822e98 @p=0.45454545454545453, @s=5, @k=6, @type=:on_win>
odds.revert
# => #<Fortune::Odds:0x00000002822e98 @p=0.5454545454545454, @s=6, @k=5, @type=:on_win>
odds.to_lose
# => #<Fortune::Odds:0x00000002822e98 @p=0.5454545454545454, @s=5, @k=6, @type=:on_lose>
```

### Combinatorics

#### Accomodation (A)

Permutation without repetition with select k elements.

Example: 20 different elements and you need select 5 of them (how many ways of selection exists?). Elements is ordered ([a,b,c] != [b,c,a])
```ruby
Fortune::A.calc(:elements => 10, :select => 5) # => 30240
```

#### Permutation

##### Permutation without repetition (Pn)

Example: the amount of distributions of the four teams in four places

```ruby
Fortune::Pn.calc(4) # => 24
```
other examples
```ruby
Fortune::Pn.calc(:elements => 5) # => 120
Fortune::Pn.calc(:elements => 5, :select => 2) # => 20
```

##### Permutation with repetition (Pnr)

Example: how many different options you can dress up if there are three sweaters two skirts and two hats (3*2*2, if all thing is equal 3, then: Pn_repetition(:n => 3, :k => 3), k - element groups, n - elements count in group)

```ruby
Fortune::Pn_repetition(:n => 3, :k => 3) # => 27
is equal to
Fortune::Pnr(:groups => 3, :elements => 3) # => 27 (human like variant)
```

#### Combinations

##### Combinations without repetition (C)

Example: 10 different elements (students) and you need select 5 of them (how many ways of selection exists?). Elements does not ordered ([a,b,c] == [b,c,a])

```ruby
Fortune::C.calc(:elements => 10, :select => 5) # => 252
```

##### Combination with repetition (Cr)

```ruby
Fortune::C_repetition.calc(:elements => 10, :select => 5) # => 2002
same as
Fortune::Cr.calc(:elements => 10, :select => 5) # => 2002
```

#### Addon Class Methods

`Math.factorial(n)`

`Event` class - under development 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Authors

Personal blog author: [Malykh Oleg](http://es0.ru/) - blog in russian
