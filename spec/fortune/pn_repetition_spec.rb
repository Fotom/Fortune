require "spec_helper"

describe Fortune::Pn_repetition do

  describe "calc" do
    it "get Permutation with repetition value for 5 elements and 10 groups" do
      Fortune::Pn_repetition.calc(:elements => 5, :groups => 10).should eq 100000
    end
  end

end


