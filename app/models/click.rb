class Click < ActiveRecord::Base
  attr_accessible :ip, :offer_id, :traffic_source

  belongs_to :offer

  scope :created_between, lambda {|start_date, end_date| where(created_at: start_date..end_date)}

  validates_presence_of :ip, :offer_id, :traffic_source
end
