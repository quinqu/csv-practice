require 'csv'
require 'awesome_print'



def get_all_olympic_athletes(filename)
  olympic_medalists = []

  CSV.read(filename, headers: true).each do |record|
    medalist = {
      "ID" => record["ID"],
      "Name" => record["Name"],
      "Height" => record["Height"],
      "Team" => record["Team"],
      "Year" => record["Year"],
      "City" => record["City"],
      "Sport" => record["Sport"],
      "Event" => record["Event"],
      "Medal" => record["Medal"]
    }
    olympic_medalists << medalist
  end
  return olympic_medalists
end



def total_medals_per_team(olympic_data)
  array_of_teams = []
  olympic_data.each do |person| 
    array_of_teams << {person["Teams"] => 0}
  end 
  array_of_teams = array_of_teams.uniq
  array_of_teams.to_s

  olympic_data.each do |person|
    array_of_teams.each do |team| 
          team.each do |k, v|
            if person["Teams"] == "#{k}"
              team["#{k}"] +=1
          end  
       end
    end 
  end
  return array_of_teams.to_s
end

def get_all_gold_medalists(olympic_data)
  array_of_gold = olympic_data.select do |person|
    person["Medal"] == "Gold"
  end 
  return array_of_gold
end



#puts get_all_gold_medalists([{"Team" => "US", "Medal" => "Gold"}, {"Team" => "Nigeria", "Medal" => "Gold"}, {"Team" => "US", "Medal" => "none"}])