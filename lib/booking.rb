require 'pg'
require_relative 'database_connection'

class Booking

  attr_reader :space_id, :id, :owner, :renter, :start_date, :end_date, :booking_status

  def initialize(space_id:, id:, owner:, renter:, start_date:, end_date:, booking_status:)
    @space_id = space_id
    @id = id
    @owner = owner
    @renter = renter
    @start_date = start_date
    @end_date = end_date
    @booking_status = booking_status

  end

  def self.create(start_date:, end_date:, renter:, space_id:)
    owner_query = DatabaseConnection.query("SELECT user_id FROM space WHERE id = #{space_id};")
    owner = owner_query.first['user_id']
    result = DatabaseConnection.query("INSERT INTO bookings (space_id, owner, renter, start_date, end_date)
      VALUES(
        '#{space_id}',
        '#{owner}',
        '#{renter}',
        '#{start_date}',
        '#{end_date}')
      RETURNING space_id, id, owner, renter, start_date, end_date, booking_status;")

      Booking.new(
        space_id: result[0]['space_id'],
        id: result[0]['id'],
        owner: result[0]['owner'],
        renter: result[0]['renter'],
        start_date: result[0]['start_date'],
        end_date: result[0]['end_date'],
        booking_status: result[0]['booking_status']
      )
  end
end
