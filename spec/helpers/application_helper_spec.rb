require 'rails_helper'

describe ApplicationHelper do


  context 'admin_user' do
    it 'should return true if the given username is an admin in the system' do
      AdminUser.create(name: 'Admin')

      expect(admin_user(User.new(name: 'Admin'))).to be_truthy
    end

    it 'should return false if the given username is not an admin in the system' do
      expect(admin_user(User.new(name: 'Admin'))).to be_falsey
    end
  end

  # context 'prevent_submission' do
  #   it 'should return true if the current time has past the submission end time' do
  #
  #     Timecop.freeze(Time.parse('Thu Nov 29 15:33:20 IST 2001')) do
  #       expect(prevent_submission).to be_truthy
  #     end
  #   end
  #
  #   it 'should return false if the current time is behind the submission end time' do
  #
  #     Timecop.freeze(Time.parse('Sun Oct 26 14:33:20 IST 2014')) do
  #       expect(prevent_submission).to be_falsey
  #     end
  #   end
  # end
  #
  # context 'prevent_voting' do
  #   it 'should return true if the current time has past the vote end time' do
  #
  #     Timecop.freeze(Time.parse('Thu Nov 29 15:33:20 IST 2001')) do
  #       expect(prevent_vote?).to be_truthy
  #     end
  #   end
  #
  #   it 'should return false if the current time is behind the vote end time' do
  #
  #     Timecop.freeze(Time.parse('Sun Oct 26 14:33:20 IST 2014')) do
  #       expect(prevent_vote?).to be_falsey
  #     end
  #   end
  # end
end