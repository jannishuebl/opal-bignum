require 'spec_helper'

describe Numeric do

  it "should have a CONST with the maximum Value of a Integer saved as Numeric" do
    expect(Numeric::MAX_FIXNUM).to be 94906265
  end

  it "should have a CONST with the minimum Value of a Integer saved as Numeric" do
    expect(Numeric::MIN_FIXNUM).to be -94906265
  end

  describe "+" do
    it "should add two Fixnums which are both below the MAX_FIXNUM and the result is below MAX_FIXNUM result should be Integer" do
      expect(3000 + 4000).to be 7000 
      expect(3000 + 4000).to be_kind_of(Integer) 
    end
    it "should add two Fixnums which are both below the MAX_FIXNUM and the result is above MAX_FIXNUM result should be BigNum" do
      expect(60000000 + 60000000).to be_kind_of(BigNum) 
    end
  end
end
