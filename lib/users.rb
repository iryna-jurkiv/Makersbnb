require_relative 'database_connection'

class User

  def self.create(name:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users(name, email, password) VALUES('#{name}', '#{email}', '#{password}') RETURNING name, id, email;")
    User.new(name: result[0]['name'], id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(name: result[0]['name'], id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :name, :id, :email

  def initialize(name:, id:, email:)
    @name = name
    @id = id
    @email = email
  end
end
