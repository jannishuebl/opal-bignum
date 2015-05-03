require 'spec_helper'

describe Numeric do

  it "should have a CONST with the maximum Value of a Integer saved as Numeric" do
    expect(Numeric::MAX_FIXNUM).to be 94906265
  end

  it "should have a CONST with the minimum Value of a Integer saved as Numeric" do
    expect(Numeric::MIN_FIXNUM).to be -94906265
  end
end
