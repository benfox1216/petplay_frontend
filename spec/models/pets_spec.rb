require 'rails_helper'

describe Pet, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:species)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:breed)}
    it {should validate_presence_of(:size)}
  end
  
  describe 'relationships' do
    it {should belong_to(:user)}
  end
end