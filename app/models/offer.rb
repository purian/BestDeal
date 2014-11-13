class Offer < ActiveRecord::Base
  before_create :generate_token
  attr_accessible :city, :image, :name, :price, :token

  has_many :clicks

  validates_uniqueness_of :token

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Offer.exists?(token: random_token)
    end
  end

end
