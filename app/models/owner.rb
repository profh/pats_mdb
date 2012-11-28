class Owner
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  
  # list of fields
  field :first_name, type: String
  field :last_name, type: String
  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :phone, type: String
  field :email, type: String
  
  # relationships
  has_many :pets
    
  # validations
  validates_presence_of :first_name, :last_name
  
  # states list
  STATES_LIST = [['Ohio', 'OH'],['Pennsylvania', 'PA'],['West Virginia', 'WV']]
  
  # other methods
  def name
    last_name + ", " + first_name
  end
  
  def proper_name
    first_name + " " + last_name
  end
  
end
