require_relative 'database_connection'

require 'bcrypt'
class User

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING name, id, email, password")
    User.new(name: result[0]['name'], id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(name: result[0]['name'], id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(email:, password:)
    result =DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    user = User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end

  attr_reader :name, :id, :email, :password

  def initialize(name:, id:, email:, password:)
    @name = name
    @id = id
    @email = email
    @password = password
  end
end
