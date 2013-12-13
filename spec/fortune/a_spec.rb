require "spec_helper"

describe Fortune::A do

  describe "calc" do
    it "get permutation value for 5 from 10" do
      Fortune::A.calc(:elements => 10, :select => 5).should eq 30240
    end
  end

end


