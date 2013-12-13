require "spec_helper"

describe Fortune::C do

  describe "calc" do
    it "get combinations value for 5 from 10" do
      Fortune::C.calc(:elements => 10, :select => 5).should eq 252
    end
  end

end


