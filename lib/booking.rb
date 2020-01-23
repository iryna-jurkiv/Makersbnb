require 'pg'
require_relative 'database_connection'

class Booking

  attr_reader :space_id, :id, :owner, :renter, :start_date, :end_date, :booking_status

  def initialize(space_id, id, owner, renter, start_date, end_date, booking_status)
    @space_id = space_id
    @id = id
    @owner = owner
    @renter = renter
    @start_date = start_date
    @end_date = end_date
    @booking_status = booking_status

  end

  def self.create(start_date, end_date, renter_id, space_id)
    result = DatabaseConnection.query("INSERT INTO boookings (space_id, owner, renter, start_date, end_date)
      VALUES(
        '#{space_id}',
        '(SELECT user_id FROM space WHERE id = #{space_id})',
        '#{renter_id}',
        '#{start_date}',
        '#{end_date}')
      RETURNING space_id, id, owner, renter, start_date, end_date, booking_status;")

      Booking.new(
        space_id: [0]['space_id'],
        id: [0]['id'],
        owner: [0]['owner'],
        renter: [0]['renter'],
        start_date: [0]['start_date'],
        end_date: [0]['end_date'],
        booking_status: [0]['booking_status']
      )
  end
end
