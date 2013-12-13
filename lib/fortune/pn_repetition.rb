module Fortune

  # Permutation with repetition
  # example: how many different options you can dress up if there are three sweaters two skirts and two hats (3*2*2, if all thing is equal 3, then: Pn_repetition(:n => 3, :k => 3), k - element groups, n - elements count in group)
  #   Pnr.calc(:groups => 10, :elements => 5)
  class Pn_repetition < P_abstract
    def initialize(h)
      super(h, {:n => :groups, :k => :elements})
      self.value = self.n**self.k
    end
  end

end