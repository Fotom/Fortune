require "spec_helper"

describe Fortune::P do

  describe "new" do
    it "create by n, m params" do
      Fortune::P.new(:m => 1, :n => 10).value.should eq 0.1
    end
    it "create by list params" do
      Fortune::P.new(1, 10).value.should eq 0.1
    end
    it "create by probability params" do
      Fortune::P.new(0.1).value.should eq 0.1
    end
  end

  describe "addition" do
    it "p + p = 2p" do
      (Fortune.P(0.1) + Fortune.P(0.2)).p.round(5).should eq Fortune.P(0.3).p.round(5)
    end
  end

  describe "multiplication" do
    it "p*p = p^2" do
      (Fortune.P(0.1) * Fortune.P(0.2)).p.round(5).should eq Fortune.P(0.02).p.round(5)
    end
  end

  describe "odds" do
    it "calc odds for probability" do
      Fortune.P(0.1).odds.should eq Fortune::Odds.new(:win => 1, :lose => 9)
    end
  end

  it "to_percent conversation" do
    Fortune.P(0.1).to_percent.should eq 10
  end
  it "check event is happen" do
    Fortune::P.is(1,10**10).should eq false
  end

  describe "n" do
    it "get random element from array" do
      Fortune::P.n([1,1,1]).should eq 1
    end
    it "get random element from range" do
      Fortune::P.n(100).should < 101
      Fortune::P.n(100).should > 0
    end
  end

end


