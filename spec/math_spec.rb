require "spec_helper"

describe Math do

  it "should have factorial method" do
    Math.should respond_to :factorial
  end
  it "correct calc factorial" do
    Math.factorial(5).should eq(120)
  end

end
