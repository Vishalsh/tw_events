require 'rails_helper'

describe Event do
  it 'should validates presence of name, submission_close_date, voting_close_date' do
    should validate_presence_of :name
    should validate_presence_of :submission_close_date
    should validate_presence_of :voting_close_date
  end
end