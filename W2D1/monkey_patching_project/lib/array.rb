# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.length == 0
    self.sum * 1.0 / self.length
  end

  def median
    return nil if self.length == 0
    middle = self.sort.length / 2
    if self.length.even?
        middle = (self.length / 2) - 1
        self.sort!
        (self[middle] + self[middle+1]) / 2.0
    else
        self.sort!
        self[middle]
    end
  end

  def counts
    output = Hash.new {|h, k| h[k] = 0}
    self.each { |ele| output[ele] += 1 }
    output
  end

  def my_count(value)
    count = 0
    self.each {|ele| count +=1 if value == ele}
    count
  end

  def my_index(value)
    indicies = []
    self.each_with_index do |ele, i|
        if ele == value
            indicies << i
        end
    end
    if indicies.length == 0
        return nil
    end
    indicies.min
  end

  def my_uniq
    new_array = []
    self.each do |ele|
       new_array << ele if !new_array.include?(ele)
    end
    new_array
  end

  def my_transpose
    new_matrix = Array.new(self.length){Array.new(self.length)}
    self.each_with_index do |row, i|
        row.each_with_index do |coll, j|
            new_matrix[j][i] = coll
        end
    end
    new_matrix
  end

end
