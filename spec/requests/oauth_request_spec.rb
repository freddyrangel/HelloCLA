require 'rails_helper'

RSpec.describe 'OAuth requests', type: :request do
  describe 'GitHub' do
    context 'create' do
      before(:each) { stub_github(request: request) }

      context 'happy path' do
        before(:each) { get "/auth/github/callback" }

        it { expect(response).to redirect_to(new_agreement_path) }
        it { expect(session[:user_id]).to_not be_nil }
        it { expect(session[:user_id]).to eq(User.last.id) }
      end

      context 'sad path' do
        before(:each) do
          allow(User).to receive(:from_omniauth).and_return(nil)
          get "/auth/github/callback"
        end

        it { expect(response).to redirect_to(root_path) }
        it { expect(session[:user_id]).to be_nil }
      end
    end

    context 'destroy' do
        before(:each) { delete "/sessions" }

        it { expect(response).to redirect_to(root_path) }
        it { expect(session[:user_id]).to be_nil }
    end
  end
end
