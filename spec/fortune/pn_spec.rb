require "spec_helper"

describe Fortune::Pn do

  describe "calc" do
    it "get Permutation value for 5 from 10" do
      Fortune::Pn.calc(:elements => 10, :select => 5).should eq 30240
    end
    it "get Permutation value for 5" do
      Fortune::Pn.calc(:elements => 5).should eq 120
    end
  end

end


