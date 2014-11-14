class Offer < ActiveRecord::Base
  before_create :generate_token
  attr_accessible :city, :image, :name, :price, :token

  has_many :clicks

  validates_uniqueness_of :token

  scope :by_clicks_created_between, lambda {|start_date, end_date| includes(:clicks).where({:clicks => {created_at: start_date..end_date}})}

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Offer.exists?(token: random_token)
    end
  end

end
