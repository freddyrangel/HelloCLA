require 'rails_helper'

feature 'user login' do
  before(:each) do
    stub_github
  end

  scenario 'new user should go to new agreement page' do
    visit root_path
    click_on 'Sign in with GitHub'
    expect(current_path).to eq(new_agreement_path)
  end
end
