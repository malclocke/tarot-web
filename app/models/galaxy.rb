class Galaxy < ActiveRecord::Base
  attr_accessible :name
  has_one :reference

  validates :name, :presence => true, :uniqueness => true
end
