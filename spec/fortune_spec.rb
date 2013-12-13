require "spec_helper"

describe Fortune do

  describe "P" do
    it {Fortune.P(0.1).value.should eq(0.1)}
  end

end


