require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    before(:each) { get :index }
    it { expect(response.status).to eq(200) }
  end
end
