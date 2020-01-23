feature 'request booking' do
  scenario 'user can request to book a space' do
    visit('/space/id')
    fill_in :start_date, with: "2020-02-01"
    fill_in :end_date, with: "2020-02-04"
    click_button("Request")

    expect(page.status_code).to eq 200
    expect(page).to have_content 'Your request has been sent for approval'

  end
end
