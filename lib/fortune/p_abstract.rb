module Fortune

  # Permutations
  class P_abstract
    attr_accessor :value, :n, :k

    def initialize(h, format = {:n => :elements, :k => :select})
      raise ArgumentError.new("Error: arguments should be hash") unless h.is_a?(Hash)
      self.n = h[:n] || h[format[:n]]
      self.k = h[:k] || h[format[:k]]
      self.value = h
    end

    def self.calc(n)
      self.new(n).value
    end
  end

end
