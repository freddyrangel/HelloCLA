require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Active Record' do
    context 'validations' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }
      it { is_expected.to validate_presence_of(:nickname) }
      it { is_expected.to validate_uniqueness_of(:nickname) }
    end
  end
end
