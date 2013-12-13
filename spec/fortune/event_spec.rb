require "spec_helper"

describe Fortune::Event do

  it "should have p" do
    Fortune::Event.new(:name => :get_prize, :m => 1, :n => 5).p.should eq 0.2
  end
  it "certain event should be" do
    Fortune::Event.new(:name => :get_prize, :m => 1, :n => 1).try.has_come?.should eq true
  end
  it "impossible event should not be" do
    Fortune::Event.new(:name => :get_prize, :m => 0, :n => 1).try.has_come?.should eq false
  end

end


