require './lib/database_connection'

if ENV['ENVIRONMENT'] == "test"
  DatabaseConnection.setup('MakersBnB_test')
else
  DatabaseConnection.setup('MakersBnB')
end
