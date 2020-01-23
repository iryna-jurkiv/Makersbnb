require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up connection to the database' do
    expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

    DatabaseConnection.setup('makersbnb_test')
    end
  end

  describe '.connection' do
    it 'ensures that connection is persistent' do
      connection =DatabaseConnection.setup('makersbnb_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'queries the database' do
      connection =DatabaseConnection.setup('makersbnb_test')

      expect(connection).to receive(:exec).with("SELECT * from space;")

      DatabaseConnection.query("SELECT * from space;")
    end
  end
end
