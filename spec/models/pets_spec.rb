require 'rails_helper'

describe Pet, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:species)}
    it {should validate_presence_of(:breed)}
    it {should validate_presence_of(:size)}
    it {should validate_presence_of(:about_me)}
  end
  
  describe 'relationships' do
    it {should belong_to(:user)}
  end
end