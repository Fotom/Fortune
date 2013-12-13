module Fortune

  # Combinations without repetition
  # example: 10 different elements (students) and you need select 5 of them (how many ways of selection exists?)
  #   elements does not ordered ([a,b,c] == [b,c,a])
  #   C.calc(:elements => 10, :select => 5)
  class C < P_abstract
    def initialize(h)
      super(h)
      self.value = Math.factorial(self.n)/(Math.factorial(self.k)*Math.factorial(self.n - self.k))
    end
  end

end