require 'rails_helper'

feature 'Home page' do
  scenario 'home page exists' do
    expect { visit root_path }.to_not raise_error
  end
end
