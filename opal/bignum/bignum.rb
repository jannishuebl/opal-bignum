class BigNum 

  attr_accessor :self_bignumber

  def initialize(x)
    if `x instanceof BigNumber`
      @self_bignumber = x
    else
      x = x.self_bignumber if x.kind_of? BigNum
      @self_bignumber = create_new_BigNumber(x) 
    end
  end

  def create_new_BigNumber(x)
    bignumber = nil
    %x{
      bignumber = new BigNumber(x);
    }
    bignumber
  end

  def +@
    other = other.self_bignumber if other.kind_of? BigNum
    BigNum.new self
  end

  def +(other)
    other = other.self_bignumber if other.kind_of? BigNum
    BigNum.new `this.$self_bignumber().plus(other)`
  end

  def -@
    other = other.self_bignumber if other.kind_of? BigNum
    BigNum.new `this.$self_bignumber().negated()`
  end

  def -(other)
    other = other.self_bignumber if other.kind_of? BigNum
    return_integer_when_possible(BigNum.new `this.$self_bignumber().minus(other)`)
  end

  def *(other)
    other = other.self_bignumber if other.kind_of? BigNum
    return_integer_when_possible(BigNum.new `this.$self_bignumber().mul(other)`)
  end

  def /(other)
    other = other.self_bignumber if other.kind_of? BigNum
    return_integer_when_possible(BigNum.new `this.$self_bignumber().div(other)`)
  end

  def ==(other)
    other = is_compareable? other
    `this.$self_bignumber().equals(other)`
  end

  def <(other)
    other = is_compareable? other
    `this.$self_bignumber().lessThan(other)`
  end

  def >(other)
    other = is_compareable? other
    `this.$self_bignumber().greaterThan(other)`
  end

  def to_s
    `this.$self_bignumber().toString()`.to_s
  end

  def inspect
    to_s.inspect
  end

  private

  def is_compareable?(x)
    fail ArgumentError, "Argument not of Numeric Type" unless (x.kind_of?(Numeric) || x.kind_of?(BigNum))
    x = BigNum.new x if x.kind_of? Numeric
    x.self_bignumber 
  end

  def return_integer_when_possible(x)
    puts "x"
    puts x
    if x < Numeric::MAX_FIXNUM && x > Numeric::MIN_FIXNUM && `x.$self_bignumber().isInt()`
      return `x.$self_bignumber().toNumber()`
    end
    x
  end
end
