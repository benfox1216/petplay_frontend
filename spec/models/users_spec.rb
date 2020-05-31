require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:image)}
    it {should validate_presence_of(:zipcode)}
  end
  
  describe 'relationships' do
    it {should have_many(:pets).dependent(:destroy)}
  end
end