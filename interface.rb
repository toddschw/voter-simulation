module Interface

def add_pol
    print "Enter politician name: "
    new_pol_name = gets.chomp

    print "Enter his/her party: "
    new_pol_party = gets.chomp

    Politician.new(new_pol_name,new_pol_party)
    puts "\nPolitician added."
    puts "Returning to Main Menu...."

end


def add_voter
    print "Enter Voter's Name: "
    new_voter_name = gets.chomp

    puts "Enter political affiliation:"
    puts "(\"Tea Party\", \"Conservative\", \"Neutral\", \"Liberal\", \"Socialist\"): "
    new_voter_aff = gets.chomp

    Voter.new(new_voter_name,new_voter_aff)
    puts "\nVoter added"
    puts "Returning to Main Menu..."
end

def list_pols
  puts "Listing Politicians:"
  puts "-------------------"
  Politician.elements.sort_by do  |x|
    print x.name
    print ", "
    puts x.party
  end
  puts ""
end

def list_voters
  puts "Listing Voters:"
  puts "--------------"
  Voter.elements.sort_by do  |x|
    print x.name
    print ", "
    puts x.politics
  end
  puts ""
end

def update
  puts "Who would you like to update?"
  old_name = gets.chomp

  size_pol = Politician.elements.size
  counter = 0
  while counter < size_pol
    if Politician.elements[counter].name.downcase == old_name.downcase
      print "Enter new name: "
      new_name = gets.chomp

      Politician.elements[counter].name =  new_name
      puts "#{old_name} updated to #{new_name}."

      puts "Would you like to also update party? y/n"
      update_party = gets.chomp.downcase
      if update_party == "y"
          puts "What is new party?"
          new_party = gets.chomp
          Politician.elements[counter].party = new_party
          puts "Party updated to #{new_party}."
      end

      found_flag = true
    end
    counter += 1
  end

  size_voter = Voter.elements.size
  my_counter = 0
  while my_counter < size_voter
    if Voter.elements[my_counter].name.downcase == old_name.downcase
      print "Enter new name: "
      new_name = gets.chomp

      Voter.elements[my_counter].name = new_name
      puts "#{old_name} updated to #{new_name}."

      puts "Would you like to also update political affiliation? y/n"
      update_aff = gets.chomp.downcase
      if update_aff == "y"
          puts "What is new poltiical affiliation?"
          new_aff = gets.chomp
          Voter.elements[my_counter].politics = new_aff
          puts "Politcal affiliation updated to #{new_aff}."
      end
     found_flag_2 = true
    end
      my_counter += 1
  end

  if found_flag != true and found_flag_2 != true
    puts "Name not found!"
  end

  puts "Returning to main menu..."
end


def run_sim
    # create emtpy hash
    tally_hash = {}

    # add politicians vote to hash
    Politician.elements.each do |x|
      tally_hash[x.name] = 1
      puts "I'm #{x.name}, a Politician. I vote for myself, #{x.name}"
    end

    # allow voters to vote
    size_voter = Voter.elements.size
    my_counter = 0
    while my_counter < size_voter
       vote_for = Voter.elements[my_counter].vote
      my_counter += 1

      # add vote to hash
      tally_hash.each do |x,y|
        if x == vote_for
          tally_hash[x] = y + 1
        end
      end
    end

    #display results
    puts "\n\nElection Results:"
    puts "----------------"
    tally_hash.each do | candidate,votes |
      puts "Candidate: #{candidate}, votes: #{votes}"
    end



    most_votes = tally_hash.values.max
    winner = tally_hash.select { |k, v| v == most_votes }.keys

    puts "\nThe Winner is #{winner}"
    puts "Returning to main menu..."
end


def main

  puts <<-EOP

        WELCOME TO OUR VOTING SIM!

     Please make your selection below:

   (C)reate, (L)ist, (U)pdate, (V)ote, or (X) to exit

  EOP

  ans = gets.chomp
  case ans
  when "C", "c"
    puts "Who would you like to create?"
    puts "(P)olitician or a (V)oter?"
    create = gets.chomp
       if create == "P" or create == "p"
        add_pol
      elsif create == "V" or create == "v"
        add_voter
      end
  when "L", "l"
    list_pols
    list_voters
    puts "Returning to Main Menu..."
  when "U", "u"
    update
  when "V", "v"
    run_sim
  when "X","x"
    exit
  else
    puts "sorry I didn't understand"
  end
    main
end

end
