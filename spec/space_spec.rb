require 'space'
require 'database_helpers'

describe Space do
  describe '.create' do
    it 'creates a space' do
      user = User.create(name: 'Test', email: 'test@example.com', password: 'password123')
      space = Space.create(name: 'Test Name', description: 'Test Description',
      price: 50,available_from: '2020-01-01', available_to: '2020-01-30', user_id: user.id)

      expect(space.name).to eq 'Test Name'
    end
  end

  describe '.all' do
    it 'returns all spaces' do
      user = User.create(name: 'Test', email: 'test@example.com', password: 'password123')
      space = Space.create(name: 'Test Name', description: 'Test Description',
      price: 50,available_from: '2020-01-01', available_to: '2020-01-30', user_id: user.id)
      spaces = Space.all

      expect(spaces.first.name).to eq "Test Name"
    end
  end
end
