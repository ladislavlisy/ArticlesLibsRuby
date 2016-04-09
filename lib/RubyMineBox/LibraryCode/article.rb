class Article
  attr_reader :code
  attr_reader :catg
  attr_reader :pendings

  def initialize(code, catg, pendings)
    @code = code
    @catg = catg
    @pendings = pendings.dup
  end

  def ==(other)
    @code == other.code
  end

  def <=>(other)
    @code <=> other.code
  end

  def <(other)
    @code < other.code
  end

  def >(other)
    @code > other.code
  end

  def eql?(other)
    @code == other.code
  end

  def hash
    @code.hash
  end

  def to_s
    @code.to_s
  end
end
