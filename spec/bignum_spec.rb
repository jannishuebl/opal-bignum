require 'spec_helper'

describe BigNum do

  let(:largest_integer) { Numeric::MAX_FIXNUM }
  let(:larg_integer) { Numeric::MAX_FIXNUM - 1000000 }

  let(:smallest_integer) { Numeric::MIN_FIXNUM }
  let(:small_integer) { Numeric::MIN_FIXNUM + 1000000 }

  let(:small_big_num_string) { 3.times.map { Numeric::MAX_FIXNUM}.join }
  let(:big_num_string) { 6.times.map { Numeric::MAX_FIXNUM}.join }
  let(:large_big_num_string) { 12.times.map { Numeric::MAX_FIXNUM}.join }
  let(:small_big_num) { BigNum.new(3.times.map { Numeric::MAX_FIXNUM}.join) }
  let(:big_num) { BigNum.new(6.times.map { Numeric::MAX_FIXNUM}.join) }
  let(:large_big_num) { BigNum.new(12.times.map { Numeric::MAX_FIXNUM}.join) }

  let(:neg_big_num) { BigNum.new("-#{6.times.map { Numeric::MAX_FIXNUM}.join}") }

  describe ".new" do
    it "create a BigNum from a Sting" do
      expect(BigNum.new("123456").to_s).to eq "123456"
    end

    it "create a BigNum from an Integer" do
      expect(BigNum.new(123456).to_s).to eq "123456"
    end
  end

  describe "+@" do
    it " = BigNum" do
      expect(+ big_num).to be_instance_of BigNum 
      expect(+ big_num).to eq BigNum.new big_num_string
    end
  end
  describe "+" do
    it "BigNum = BigNum" do
      expect(big_num + big_num).to be_instance_of BigNum 
      expect(big_num + big_num).to eq BigNum.new "1898125318981253189812531898125318981253189812530" 
    end
    it "Integer = BigNum" do
      puts big_num_string
      puts larg_integer
      expect(big_num + larg_integer).to be_instance_of BigNum 
      expect(big_num + larg_integer).to eq BigNum.new "949062659490626594906265949062659490626688812530" 
    end
  end
  describe "-@" do
    it " = BigNum" do
      expect(- big_num).to be_instance_of BigNum 
      expect(- big_num).to eq BigNum.new "-949062659490626594906265949062659490626594906265"
    end
    it " - = BigNum" do
      expect(- big_num).to be_instance_of BigNum 
      expect(- neg_big_num).to eq BigNum.new "949062659490626594906265949062659490626594906265"
    end
  end
  describe "-" do
    it "BigNum#Small = BigNum" do
    puts big_num_string
    puts small_big_num_string
    puts larg_integer
      expect(big_num - small_big_num).to be_instance_of BigNum 
      expect(big_num - small_big_num).to eq BigNum.new "949062659490626594906265000000000000000000000000" 
    end
    it "Integer = BigNum" do
      expect(big_num - larg_integer).to be_instance_of BigNum 
      expect(big_num - larg_integer).to eq BigNum.new("949062659490626594906265949062659490626501000000")
    end
    it "BigNum = Integer" do
      expect(big_num - big_num).to be_instance_of Integer 
      expect(big_num - big_num).to eq 0
    end
    it "#Small - BigNum#Big = BigNum" do
      puts large_big_num_string
      expect(small_big_num - large_big_num).to be_instance_of BigNum 
      expect(small_big_num - large_big_num).to eq BigNum.new("-949062659490626594906265949062659490626594906265949062659490626594906265000000000000000000000000")
    end
  end
  describe "*" do
    it "BigNum#Small = BigNum" do
      expect(big_num * small_big_num).to be_instance_of BigNum 
      expect(big_num * small_big_num).to eq BigNum.new "900719931639421042716426789666517896665178966650888946586257244136250225" 
    end
    it "Integer = BigNum" do
      expect(big_num * larg_integer).to be_instance_of BigNum 
      expect(big_num * larg_integer).to eq BigNum.new("89122929603731546037315460373154603731546037315371250225")
    end
    it "#Small - BigNum#Large = BigNum" do
      puts large_big_num_string
      expect(small_big_num * -large_big_num).to be_instance_of BigNum 
      expect(small_big_num * -large_big_num).to eq BigNum.new("-900719931639421042716426789666517896665178966651789666517896665178966651789666517896665178966650888946586257244136250225")
    end
  end
  describe "/" do
    it "BigNum#Small = BigNum" do
    puts big_num_string
    puts small_big_num_string
    puts larg_integer
      expect(big_num / small_big_num).to be_instance_of BigNum 
      expect(big_num / small_big_num).to eq BigNum.new "1000000000000000000000001" 
    end
    it "Integer = BigNum" do
      expect(big_num / larg_integer).to be_instance_of BigNum 
      expect(big_num / larg_integer).to eq BigNum.new("1.010648926874715542042126741024850142454920240161825198776674e+40")
    end
    it "BigNum = Integer" do
      expect(big_num / big_num).to be_instance_of Integer 
      expect(big_num / big_num).to eq 1
    end
    it "(#Small / BigNum#Big) = BigNum" do
      `BigNumber.config({ POW_PRECISION: 0 })`
      expect(small_big_num / big_num).to be_instance_of BigNum 
      expect(small_big_num / big_num).to eq BigNum.new("-949062659490626594906265949062659490626594906265949062659490626594906265000000000000000000000000")
    end
  end
end
