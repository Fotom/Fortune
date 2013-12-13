module Fortune

  class P
    attr_accessor :p, :m, :n

    # P.new(:m => 1, :n => 10), P.new(1, 10), P.new(0.1)
    def initialize(m, n_all = nil)
      m, n_all = m[:m], m[:n] if m.is_a?(Hash)
      raise ArgumentError.new("Error: p should be less or equal 1") if (!n_all && m > 1) || (n_all && m > n_all)
      @p = m unless n_all
      @p = m.to_f/n_all.to_f if n_all
      @m, @n = m, n_all if n_all
    end

    def +(other)
      P.new(self.p + other.p)
    end

    def *(other)
      P.new(self.p * other.p)
    end

    def odds
      Odds.new(:p => self.p)
    end

    def to_percent_human
      self.to_percent.round(2)
    end
    alias :to_human :to_percent_human

    def to_percent
      self.p*100
    end

    def to_percent_string
      '%5.2f' % [self.to_percent] + '%'
    end

    def value
      self.p
    end

    def self.is(chance, n_all)
      P.n(n_all) <= chance
    end
    def self.n(n_all)
      n_all.is_a?(Array) ? n_all.sample : rand(n_all) + 1
    end
    # P.n_select([1..10] => 5, [3..15] => 20, ...)
    #   || P.n_select(10 => 90, 5 => 10)
    #   || P.n_select([:a, :b] => 1, [:c] => 2)
    def self.n_select(h = {})
      P.n(Event.select(h))
    end
  end

end