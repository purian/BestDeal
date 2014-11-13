class Click < ActiveRecord::Base
  attr_accessible :ip, :offer_id

  belongs_to :offer

  validates_presence_of :ip, :offer_id
end
