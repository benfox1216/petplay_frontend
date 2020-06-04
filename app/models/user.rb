class User < ApplicationRecord
  validates :zipcode, zipcode: { country_code: :us }, presence: true
  validates_presence_of :name, :email, :image
  
  has_many :pets, dependent: :destroy
  has_many :petplays, dependent: :destroy

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.google_token = auth.credentials.token
    end
  end
end
