module Fortune

  # Permutation without repetition with select k elements (accommodation)
  # example: 20 different elements and you need select 5 of them (how many ways of selection exists?)
  #   elements is ordered ([a,b,c] != [b,c,a])
  #   A.calc(:elements => 10, :select => 5)
  class A < P_abstract
    def initialize(h)
      super(h)
      self.value = Math.factorial(self.n)/Math.factorial(self.n - self.k)
    end
  end

end