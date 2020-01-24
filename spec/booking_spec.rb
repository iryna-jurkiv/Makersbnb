require 'space'
require 'database_helpers'

describe Booking do

  describe '.create' do
    it "creates a new booking request" do
      owner = User.create(name: 'Owner', email: 'test@example.com', password: 'password123')
      renter = User.create(name: 'Renter', email: 'tester@example.com', password: 'password123')
      space = Space.create(name: 'Test Name', description: 'Test Description',
      price: 50,available_from: '2020-01-01', available_to: '2020-01-30', user_id: owner.id)
      booking_request = Booking.create(start_date: '2020-03-01', end_date: '2020-03-03', renter: renter.id, space_id: space.id)

      expect(booking_request).to be_a Booking
      expect(booking_request.owner).to eq owner.id
      expect(booking_request.space_id).to eq space.id
      expect(booking_request.renter).to eq renter.id
      expect(booking_request.start_date).to eq '2020-03-01'
      expect(booking_request.end_date).to eq '2020-03-03'
      expect(booking_request.booking_status).to eq "reserved"
    end
  end

end
