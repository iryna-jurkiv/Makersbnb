require 'space'
require 'database_helpers'

describe Booking do

  describe '.create' do
    it "creates a new booking request" do
      booking_request = Booking.create('2020-03-01', '2020-03-03', 2)

      expect(booking_request).to be_a Booking
      expect(booking_request.owner).to eq 1
      expect(booking_request.space_id).to eq 2
      expect(booking_request.renter).to eq 6
      expect(booking_request.start_date).to eq '2020-03-01'
      expect(booking_request.end_date).to eq '2020-03-03'
      expect(booking_request.booking_status).to eq "reserved"
    end
  end

end
