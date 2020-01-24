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

  def self.where(user_id:)
    result = DatabaseConnection.query("SELECT space.name, space.price, bookings.start_date, bookings.end_date, bookings.id, bookings.booking_status
                                      FROM bookings JOIN space on bookings.space_id = space.id
                                      JOIN users on bookings.renter = users.id
                                      WHERE space.user_id = #{user_id} ;")

  end

  def self.update(booking_id:)
    result = DatabaseConnection.query("UPDATE bookings SET booking_status = 'confirmed' WHERE id = '#{booking_id}'")
    end

  def self.delete(booking_id:)
    result = DatabaseConnection.query("DELETE FROM bookings WHERE id = '#{booking_id}'")
  end

end
