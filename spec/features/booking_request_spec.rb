# feature 'request booking' do
#   scenario 'user can request to book a space' do
#     visit 'sessions/new'
#     fill_in(:email, with: 'test@example.com')
#     fill_in(:password, with: 'password123')
#     click_button('Sign in')
#     visit '/space/new'
#     fill_in('name',with: 'Test Space')
#     fill_in('description',with: 'Test Description')
#     fill_in('price',with: 50)
#     fill_in('available_from', with: '2020-01-01')
#     fill_in('available_to', with: '2020-01-30')
#     click_button('Add')
#     visit '/space/1'
#     fill_in('start_date', with: "2020-02-01")
#     fill_in('end_date', with: "2020-02-04")
#     click_button("Request")
#
#     expect(page.status_code).to eq 200
#     expect(page).to have_content 'Thank you for your request'
#
#   end
# end
