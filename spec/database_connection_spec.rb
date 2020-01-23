require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up connection to the database'
    expect(PG).to receive(:connect).with(dbname: 'MakersBnB_test')

    DatabaseConnection.setup('MakersBnB_test')
  end
end
