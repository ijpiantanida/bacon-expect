describe "Matcher::RaiseError" do
  it 'raise_error without argument passes when the block raises any exception' do
    expect{ 1/0 }.to raise_error
  end

  it "raise_error without argument failes when the block doesn't raise any exception" do
    expect_failure{ expect{ Object.new }.to raise_error }
  end

  it "raise_error with a class argument passes when the block raises an exception of the argument class" do
    expect{ 1/0 }.to raise_error(ZeroDivisionError)
  end

  it "raise_error with a class argument fails when the block raises an exception of a different class" do
    expect_failure{ expect{ 1/0 }.to raise_error(ArgumentError) }
  end

  it "raise_error with a string argument passes when the block raises an exception with a message that includes the string" do
    expect{ raise "one message" }.to raise_error("one message")
  end

  it "raise_error with a string argument fails when the block raises an exception with a message that doesn't include the string" do
    expect_failure{ expect{ raise "one message" }.to raise_error("different") }
  end

  it "raise_error with a Regex argument passes when the block raises an exception with a message that matches the Regex" do
    expect{ raise "one message" }.to raise_error(/message/)
  end

  it "raise_error with a Regex argument fails when the block raises an exception with a message that doesn't match the Regex" do
    expect_failure{ expect{ raise "one message" }.to raise_error(/different/) }
  end

  it "raise_error with a class and a string argument passes if the block raises an exception of the same class and includes the string in its message" do
    expect{ raise ArgumentError.new("with a message") }.to raise_error(ArgumentError, "message")
  end

  it "raise_error with a class and a string argument fails if the block raises an exception of the same class and but doesn't include the string in its message" do
    expect_failure{ expect{ raise ArgumentError.new("with a message") }.to raise_error(ArgumentError, "different") }
  end

  it "raise_error with a class and a string argument fails if the block raises an exception of a different class" do
    expect_failure{ expect{ raise ArgumentError.new("with a message") }.to raise_error(ZeroDivisionError, "message") }
  end

  it "raise_error with a class and a regex argument passes if the block raises an exception of the same class and includes the string in its message" do
    expect{ raise ArgumentError.new("with a message") }.to raise_error(ArgumentError, /message/)
  end

  it "raise_error with a class and a regex argument fails if the block raises an exception of the same class and but doesn't include the string in its message" do
    expect_failure{ expect{ raise ArgumentError.new("with a message") }.to raise_error(ArgumentError, /different/) }
  end

  it "raise_error with a class and a regex argument fails if the block raises an exception of a different class" do
    expect_failure{ expect{ raise ArgumentError.new("with a message") }.to raise_error(ZeroDivisionError, /message/) }
  end

  it "raise_exception is an alias of raise_error " do
    expect{ 1/0 }.to raise_exception(ZeroDivisionError)
  end
end