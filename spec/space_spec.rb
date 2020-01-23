require 'space'
require 'database_helpers'

describe Space do
  describe '.create' do
    it 'creates a space' do
      space = Space.create(name: 'Test Name', description: 'Test Description',
      price: 50,available_from: '2020-01-01', available_to: '2020-01-30' )

      expect(space.name).to eq 'Test Name'
    end
  end

  describe '.all' do
    it 'returns all spaces' do
      space = Space.create(name: 'Test Name',description: 'Test Description',
      price: 50,available_from: '2020-01-01',available_to: '2020-01-30' )
      spaces = Space.all

      expect(spaces.first.name).to eq "Test Name"
    end
  end
end
