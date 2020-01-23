require 'pg'
require_relative 'database_connection'

class Space
  attr_reader :id, :name, :description, :price, :available_from, :available_to

  def initialize(id:, name:, description:, price:, available_from:, available_to:)
    @id = id
    @name = name
    @description = description
    @price = price
    @available_from = available_from
    @available_to = available_to
  end

def self.create(name:, description:, price:, available_from:,
  available_to:)
    result = DatabaseConnection.query("INSERT INTO space (name, description,
      price, available_from, available_to) VALUES('#{name}','#{description}',
        '#{price}','#{available_from}','#{available_to}') RETURNING id, name,
        description, price, available_from, available_to;")
    Space.new(
        id: result[0]['id'],
        name: result[0]['name'],
        description: result[0]['description'],
        price: result[0]['price'],
        available_from: result[0]['available_from'],
        available_to: result[0]['available_to'])
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
      available_to: space['available_to'])
    end
  end
end
