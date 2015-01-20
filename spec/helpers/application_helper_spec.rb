require 'rails_helper'

describe ApplicationHelper do

  context 'convert_array_to_string' do
    it 'should convert array to the string' do
      expect(convert_array_to_string([OpenStruct.new(name: 'a'), OpenStruct.new(name: 'b'), OpenStruct.new(name: 'c')])).to eq "a, b, c"
    end
  end

  context 'prevent_submission' do
    it 'should return true if the current date has past the submission end date' do
      @event = build(:valid_event_1)
      expect(prevent_submission).to be_truthy
    end

    it 'should return false if the current date is behind the submission end date' do
      @event = build(:valid_event_1)
      @event.submission_close_date = DateTime.parse '22/01/2015'
      expect(prevent_submission).to be_falsey
    end
  end

  context 'prevent_voting' do
    it 'should return true if the current date has past the vote end date' do
      @event = build(:valid_event_1)
      expect(prevent_vote?).to be_truthy
    end

    it 'should return false if the current date is behind the vote end date' do
      @event = build(:valid_event_1)
      @event.voting_close_date = DateTime.parse '22/01/2015'
      expect(prevent_vote?).to be_falsey
    end
  end

  context 'admin_user' do
    it 'should return true if the given username is an admin in the system' do
      AdminUser.create(name: 'Admin')

      expect(admin_user(User.new(name: 'Admin'))).to be_truthy
    end

    it 'should return false if the given username is not an admin in the system' do
      expect(admin_user(User.new(name: 'Admin'))).to be_falsey
    end
  end

  context 'category_options' do
    it 'should return the category options for the event' do
      options = "<option value=\"workshop (60 min)\">workshop (60 min)</option>\n<option value=\"lightning (10 min)\">lightning (10 min)</option>"
      expect(category_options).to eq options
    end
  end

end