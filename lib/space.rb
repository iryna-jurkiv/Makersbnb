require 'pg'
require_relative 'database_connection'

class Space
  attr_reader :id, :name, :description, :price, :available_from, :available_to, :user_id

  def initialize(id:, name:, description:, price:, available_from:, available_to:, user_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @available_from = available_from
    @available_to = available_to
    @user_id = user_id
  end

def self.create(name:, description:, price:, available_from:,
  available_to:, user_id: )
    result = DatabaseConnection.query("INSERT INTO space (name, description,
      price, available_from, available_to, user_id) VALUES('#{name}','#{description}',
        '#{price}','#{available_from}','#{available_to}', '#{user_id}') RETURNING id, name,
        description, price, available_from, available_to, user_id ;")
    Space.new(
        id: result[0]['id'],
        name: result[0]['name'],
        description: result[0]['description'],
        price: result[0]['price'],
        available_from: result[0]['available_from'],
        available_to: result[0]['available_to'],
        user_id: result[0]['user_id'])
  end

  def self.find(id:)
      result = DatabaseConnection.query("SELECT * from space where id = '#{id}' ;")
      Space.new(
          id: result[0]['id'],
          name: result[0]['name'],
          description: result[0]['description'],
          price: result[0]['price'],
          available_from: result[0]['available_from'],
          available_to: result[0]['available_to'],
          user_id: result[0]['user_id'])
  end

def self.all
    result = DatabaseConnection.query("SELECT * from space ;")
    result.map do |space|
    Space.new(
      id: space['id'],
      name: space['name'],
      description: space['description'],
      price: space['price'],
      available_from: space['available_from'],
      available_to: space['available_to'],
      user_id: space['user_id'])
    end
  end
end
