require 'databaseConnection'


describe DatabaseConnection do
	it 'should have a setup method' do
		expect(DatabaseConnection).to respond_to(:setup)
	end

	it 'should have a setup method' do
		expect(DatabaseConnection).to respond_to(:query)
	end

	describe '.setup' do
		it 'should connect to the named database with no errors' do
			expect { DatabaseConnection.setup('bookmark_manager_test') }.not_to raise_error
		end
		
		it 'should save the database as class variable' do
			DatabaseConnection.setup('bookmark_manager_test')
			expect(DatabaseConnection.connection).to be_a_kind_of(PG::Connection)
		end
	end

	describe '.query' do
		it 'should execute SQL query' do
			DatabaseConnection.setup('bookmark_manager_test')
			DatabaseConnection.query("INSERT INTO bookmarks (title) VALUES ('test title')")
			DatabaseConnection.query("INSERT INTO bookmarks (title) VALUES ('test title 2')")
			expect(DatabaseConnection.query("SELECT COUNT (*) FROM bookmarks").getvalue(0,0).to_i).to eq(2)
		end
	end
end