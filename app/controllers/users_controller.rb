class UsersController < ApplicationController

  def my_topics
    @my_talks = 'active'
    return [] if current_user.nil?

    @event = Event.find_by(name: params[:event_name])
    registered_topics = current_user.registered_topics.order('id desc')
    voted_topics = current_user.voted_topics.order('id desc')
    @topics = registered_topics.concat(voted_topics).uniq
    @topicUserVoteStatus = Topic.new.getUserTopicVoteStatus(@topics, current_user)
  end
end
