class Tower
  attr_reader :pile
  def initialize
    @pile = []
  end

  def add_disc(disc)
    @pile << disc
  end
end