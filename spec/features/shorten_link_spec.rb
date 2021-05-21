require 'rails_helper'

RSpec.describe 'Shorten a link', type: :feature do
  scenario 'Valid url pasted' do
    visit root_path
    fill_in 'link[url]', with: 'https://www.apple.com/a_url_with_https'
    click_on 'Shorten'
    expect(page).to have_content('Here is your link:')
  end

  scenario 'Invalid url pasted' do
    visit root_path
    fill_in 'link[url]', with: 'htt://www.apple.com/a_url_with_https'
    click_on 'Shorten'
    expect(page).to have_content('Pasted url is invalid! Please try again')
  end
end