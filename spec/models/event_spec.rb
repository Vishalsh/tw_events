require 'rails_helper'


describe Event do
  it 'should validates presence of name, submission_close_date, voting_close_date' do
    should validate_presence_of :name
    should validate_presence_of :submission_close_date
    should validate_presence_of :voting_close_date
    should validate_presence_of :description
    should validate_presence_of :avatar
  end

  it 'should validate avatar' do
    should have_attached_file(:avatar)
    should validate_attachment_presence(:avatar)
    should validate_attachment_content_type(:avatar).
               allowing('image/png', 'image/gif').
               rejecting('text/plain', 'text/xml')
    should validate_attachment_size(:avatar).
               less_than(500.kilobytes)
  end
end