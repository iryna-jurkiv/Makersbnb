feature 'registration' do
  scenario 'a user can sing up' do
    visit '/users/new'
    fill_in('name', with: 'Test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome, Test"
  end
end
