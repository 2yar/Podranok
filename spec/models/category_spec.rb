require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'ActiveRecord associations' do
    it { is_expected.to have_many :products }
  end
end
