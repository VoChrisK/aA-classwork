require "byebug"

class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(length)
    pegs = Array.new(length)
    pegs.each_with_index do |peg, i|
     pegs[i] = POSSIBLE_PEGS.keys.sample
    end
    new_code = Code.new(pegs)
  end

  def self.from_string(pegs)
    r_pegs = pegs.split("")
    Code.new(r_pegs)
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs) == true
      @pegs = pegs.map(&:upcase)
    else
      raise "error"
    end
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    matches = 0
    #debugger
    code.pegs.each_with_index do |peg, i|
      if @pegs[i] == peg
        matches += 1
      end
    end
    matches
  end

  def num_near_matches(guess)
    count = guess.pegs.count do |peg|
       @pegs.include?(peg)
    end 
    count - num_exact_matches(guess)
  end
  
  def ==(code)
    return false if @pegs.length != code.pegs.length
    self.pegs == code.pegs
  end
end
