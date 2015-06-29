require 'rails_helper'

RSpec.describe 'Hello world', type: :integration do
  it 'RSpec and the app should be setup properly' do
    expect('Hello world!').to eq('Hello world!')
  end
end
