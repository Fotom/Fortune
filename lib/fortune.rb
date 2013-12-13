require "fortune/version"

require 'fortune/p_abstract'
require 'fortune/a'
require 'fortune/c'
require 'fortune/p'
require 'fortune/c_repetition'
require 'fortune/event_list'
require 'fortune/event'
require 'fortune/odds'
require 'fortune/pn'
require 'fortune/pn_repetition'

module Fortune

  factorial = %q{
    def self.factorial(n)
      return 1 if n.zero?
      1.upto(n).inject(:*)
    end
  }
  Math.module_eval(factorial)

  # alias
  Pnr = Pn_repetition

  # Fortune::Pnr(h) || Fortune.Pnr(h)
  [:Cr, :C_repetition, :C, :A, :Pnr, :Pn_repetition, :Pn].each{|c|
    Fortune.module_eval(%|
      def self.#{c}(h)
        #{c}.calc(h)
      end
    |)
  }

  # alias
  Cr = C_repetition

  def self.P(*args)
    P.new(*args)
  end

end

class Hash

  def to_P
    n = 0
    self.each{|k,v| n += v.to_i}
    self.each{|k,v| self[k] = Fortune::P(:m => v.to_i, :n => n)}
    self
  end

  def to_p
    self.to_P.each{|k,v| self[k] = v.value}
    self
  end

  # {:a => 1, :b => 2, ...}
  def choose
    Fortune::Event.select(self)
  end

  # {[:a, :b] => 1, [:c] => 2, ...} ||
  #   {10 => 1, 15 => 2, ...}
  def choose_set
    Fortune::P.n_select(self)
  end

end

