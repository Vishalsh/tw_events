class UsersController < ApplicationController

  def my_talks
    @my_talks = 'active'
    return [] if current_user.nil?

    @event = Event.find_by(name: params[:event_name])
    @topics = my_event_talks
    @topicUserVoteStatus = Topic.new.getUserTopicVoteStatus(@topics, current_user)
  end

  private
  def my_event_talks
    topics =[]
    talks = @event.talks
    talks.each { |talk|
      if talk.speakers.include?(current_user) || talk.voters.include?(current_user)
        topics << talk
      end
    }
  end
end
