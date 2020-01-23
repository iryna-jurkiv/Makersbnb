feature 'List space' do
  scenario 'A user list space on MakersBnB' do
    visit '/space/new'
    fill_in('name',with: 'Test Space')
    fill_in('description',with: 'Test Description')
    fill_in('price',with: '50')
    fill_in('available_from', with: '2020-01-01')
    fill_in('available_until', with: '2020-01-30')
    click_button('Submit')

    expect(page.status_code).to eq 200
    expect(page).to have_content 'Test Space'
  end
end
