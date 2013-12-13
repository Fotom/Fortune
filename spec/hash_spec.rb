require "spec_helper"

describe Hash do

  describe "to_p" do
    it "convert values to percent" do
      {:a => 1, :b => 3}.to_p.should == {:a => 0.25, :b => 0.75}
    end
  end

  describe "choose" do
    it "select one element" do
      [:a, :b].include?({:a => 1, :b => 3}.choose).should be_true
    end
    it "select by element weight" do
      {:a => 1.0/10**5, :b => 1*10**10, :c => 1.0/10**10}.choose.should == :b
    end
    it "select one element by weight" do
      {:a => 1, :b => 0, :c => 0}.choose.should == :a
    end
  end

  describe "choose_set" do
    it "get one from set" do
      [:a, :b, :c].include?({[:a, :b, :c] => 1, [:d] => 0}.choose_set).should == true
    end
  end

end