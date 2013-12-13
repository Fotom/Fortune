module Fortune

  # Combination with repetition
  class C_repetition < P_abstract
    def initialize(h)
      super(h)
      self.value = Math.factorial(self.n + self.k - 1)/(Math.factorial(self.k)*Math.factorial(self.n - 1))
    end
  end

end