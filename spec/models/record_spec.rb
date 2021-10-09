require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'Testing validations' do
    it { should validate_presence_of(:result) }
    it { should validate_presence_of(:date) }
  end

  describe 'Testing associations' do
    it { should belong_to(:item) }
    it { should belong_to(:user) }
  end

  describe 'Testing scopes' do
    let!(:user) { User.create(id: 1, username: 'yanick', password: '123456789') }
    let!(:item1) { Item.create(id: 1, title: 'Abc', unit: 'abc', icon: 'abc:abcicon', target: 30) }
    let!(:item2) { Item.create(id: 3, title: 'Xyz', unit: 'xyz', icon: 'xyz:xyzicon', target: 45) }
  end
end