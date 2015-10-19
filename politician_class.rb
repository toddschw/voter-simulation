class Politician

  @@elements = []

  attr_accessor :name, :party

  def self.elements
    @@elements
  end

  def initialize(name, party)
    @name = name
    @party = party
    @@elements << self
  end
end
