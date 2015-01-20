require 'rails_helper'

describe EventsHelper do

  context 'format_date' do
    it 'should format date as day, mon dd yyyy' do
      date = DateTime.parse('20/01/2015')
      expect(format_date(date)).to eq 'Tue, Jan 20 2015'
    end
  end

end
