module VisitsHelper
  # create a helper to get the options for the pet select menu
  # will return an array with key being pet_name : owner_name so 
  # that vet can choose the right pet (many pets share same names)
  def get_pet_options
    Pet.all.map{|p| ["#{p.name} (#{p.animal}) : #{p.owner.name}", p.id] }
  end
end