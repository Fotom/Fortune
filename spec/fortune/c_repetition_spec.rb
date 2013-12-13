require "spec_helper"

describe Fortune::C_repetition do

  describe "calc" do
    it "get combinations value for 5 from 10" do
      Fortune::Cr.calc(:elements => 10, :select => 5).should eq 2002
    end
  end

end


