feature 'Testing infrastructure' do
  scenario 'A user can see Hello World' do
    visit '/'

    expect(page.status_code).to eq 200
    expect(page).to have_content 'Welcome to MakersBnB'
  end
end
