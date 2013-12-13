module Fortune

  # Permutation without repetition
  # example: the amount of distributions of the four teams in four places (Pn.calc(4))
  #   Pn.calc(5), Pn.calc(:elements => 5), Pn.calc(:elements => 5, :select => 2)
  class Pn < P_abstract

    def initialize(h)
      h = {:n => h} unless h.is_a?(Hash)
      super(h)
      self.value = self.k ? A.calc(h) : Math.factorial(self.n)
    end

  end

end
