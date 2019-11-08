require "first_tdd_project"

describe Array do
  array = [1,2,1,3,3]
  describe "#my_uniq" do
    it "should return an array" do
      expect(array.my_uniq).to be_a(Array)
    end

    it "should remove duplicates from the array" do
      expect(array.my_uniq).to eq([1, 2, 3])
    end

    # it "should not call the Array#uniq method" do
    #   expect{array.my_uniq}.not_to receive(:uniq)
    # end
  end
end

describe "#my_transpose" do
  matrix = [
    [0,1,2],
    [3,4,5],
    [6,7,8]
  ]
  it "should not accept anything but a 2-D array" do
    expect { my_transpose(1) }.to raise_error(NoMethodError)
  end

  it "should transpose the matrix" do
    expect(my_transpose(matrix)).to eq([
      [0,3,6],
      [1,4,7],
      [2,5,8]
    ])
  end
end

describe "#stock_picker" do
  stock_price = [17, 8, 30, 25, 9]
  stock_price_2 = [1,10,1,10,1]

  it "should return the most profitable pair of days" do
    expect(stock_picker(stock_price)).to eq([1, 2])
  end

  context "when we have multiple pairs with the same profit" do
    it "should return a random pair" do
      expect(stock_picker(stock_price_2)).to eq([[0,1], [0,3], [2,3]].sample)
    end
  end
end