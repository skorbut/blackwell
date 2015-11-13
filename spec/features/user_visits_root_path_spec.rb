feature 'A user visits the root path' do
  scenario 'it displays a login screen first' do
    visit root_path
    expect(page).to have_content 'Sign in'
  end
end
