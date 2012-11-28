class Pet
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  
  # list of fields
  field :name, type: String
  field :animal, type: String
  field :female, type: Boolean
  field :date_of_birth, type: Date
  
  # embedded relationships
  embeds_many :visits
  accepts_nested_attributes_for :visits, :reject_if => lambda { |visit| visit[:date].blank? }, :allow_destroy => true
  
  # referenced relationships
  belongs_to :owner
  
  # validations
  validates_presence_of :name, :animal
  
  # states list
  ANIMALS_LIST = [['Bird', 'bird'],['Cat', 'cat'],['Dog', 'dog'],['Ferret', 'ferret'],['Rabbit', 'rabbit']]
    
  # other methods
  def gender
    return "Female" if female
    "Male"
  end

end
