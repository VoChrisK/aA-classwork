class Array
  def my_uniq
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1 }
    count.keys
  end
end

def my_transpose(matrix)
  new_matrix = Array.new(matrix.length) {Array.new(matrix.length)}
  matrix.each_with_index do |row, i|
    row.each_index do |j|
      new_matrix[j][i] = matrix[i][j]
    end
  end
  new_matrix
end

def stock_picker(stock_price)
  hash = Hash.new { |h,k| h[k] = []}
  stock_price.each_with_index do |ele_1, i_1|
    stock_price.each_with_index do |ele_2, i_2|
      hash[ele_2 - ele_1] << [i_1, i_2] if i_1 < i_2
    end
  end

  max = 0
  hash.each do |k, v|
    max = k if k > max
  end
  hash[max].sample
  # hash.sort_by { |k,v| k }
  # p hash
  # hash.values[0][0]
end