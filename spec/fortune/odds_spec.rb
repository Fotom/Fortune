require "spec_helper"

describe Fortune::Odds do

  before do
    @odd = Fortune::Odds.new(:win => 1, :lose => 9)
  end

  it "correct comparison" do
    @odd.should > Fortune::Odds.new(:win => 1, :lose => 99)
  end
  it "calculate variants" do
    @odd.n_all.should eq 10
    @odd.variants.should eq 10
  end

  describe "to_human" do
    it "convert for 1:7 max" do
      Fortune::Odds.new(:win => 400, :lose => 891).to_human.should eq Fortune::Odds.new(:win => 3, :lose => 7)
    end
    it "convert for 1:10 max" do
      Fortune::Odds.new(:win => 400, :lose => 891).to_human(:k => 10).should eq Fortune::Odds.new(:win => 4, :lose => 9)
    end
  end

  it "revertion" do
    @odd.revert.should eq Fortune::Odds.new(:win => 9, :lose => 1)
  end

end


