require 'rails_helper'

describe User do
  it 'should validate presence of uid, name, email address' do
    should validate_presence_of :name
  end

  describe '#from_omniauth' do

    let(:omniauth_hash) {
      OmniAuth::AuthHash.new(provider: 'google',
       uid: 1,
       info: {
         name: 'Sachin Tendulkar',
         email: 'sachinten@cricket.com',
         image: 'some url'
       },
       credentials: {
         token: 'some token',
         expires_at: DateTime.new(2016, 2, 21)
       }
      )
    }

    it 'should get the first user with uid and provider if already present' do
      user = create(:valid_user)

      expect(User.from_omniauth(omniauth_hash)).to eq(user)
    end

    it 'should create a new user with uid and provider if not already present' do
      new_user = User.from_omniauth(omniauth_hash)

      expect(new_user.uid).to eq(omniauth_hash.uid)
      expect(new_user.name).to eq(omniauth_hash.info.name)
      expect(new_user.email).to eq(omniauth_hash.info.email)
    end

  end
end