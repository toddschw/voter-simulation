class Voter

  @@elements = []

  attr_accessor :name, :politics

  def self.elements
    @@elements
  end

  def vote
    # deal with unknown number of politicians
    demo_array = []
    rep_array = []

    counter = 0
    while counter < Politician.elements.size
      if Politician.elements[counter].party == "Democrat"
        demo_array << Politician.elements[counter].name
      elsif Politician.elements[counter].party == "Republican"
        rep_array << Politician.elements[counter].name
      end
      counter += 1
    end

    # choose a random democrat
    democrat = demo_array.sample

    # choose a random republican
    republican = rep_array.sample

    # create random number from 1 to 100
    r = rand(99) + 1

    # iterate through party affiliations and allow voter to cast vote
    case politics
    when "Tea Party"
      print "I'm #{name}. My party aff is #{politics}, "
      if r <= 90
        puts "I vote for #{republican}"
        return republican
      else
        puts "I vote for #{democrat}"
        return democrat
      end
    when "Conservative"
      print "I'm #{name}. My party aff is #{politics}, "
      if r <= 75
        puts "I vote for #{republican}"
        return republican
      else
        puts "I vote for #{democrat}"
        return democrat
      end
    when "Neutral"
      print "I'm #{name}. My party aff is #{politics}, "
      if r <= 50
        puts "I vote for #{republican}"
        return republican
      else
        puts "I vote for #{democrat}"
        return democrat
      end
    when "Liberal"
      print "I'm #{name}. My party aff is #{politics}, "
      if r <= 25
        puts "I vote for #{republican}"
        return republican
      else
        puts "I vote for #{democrat}"
        return democrat
      end
    when "Socialist"
      print "I'm #{name}. My party aff is #{politics}, "
      if r <= 10
        puts "I vote for #{republican}"
        return republican
      else
        puts "I vote for #{democrat}"
        return democrat
      end

    end

  end


  def initialize(name, politics)
    @name =  name
    @politics = politics
    @@elements << self
  end
end
