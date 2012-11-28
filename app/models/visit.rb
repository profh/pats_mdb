class Visit
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  
  # list of fields
  field :date, type: Date
  field :weight, type: Integer
  
  # embedded_in relationships
  embedded_in :pet
  
  # validations
  validates_presence_of :date
    
end
