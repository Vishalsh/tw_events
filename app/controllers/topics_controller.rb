class TopicsController < ApplicationController

  def index
    @event = current_event
    @topics = @event.talks
    @topicUserVoteStatus = Topic.new.getUserTopicVoteStatus(@topics, current_user)
    @all_talks_active = 'active'
  end

  def new
    @topic = Topic.new
    @current_speakers = current_user.name
    @categories = Category.all
    respond_to do |format|
      format.html { render partial: 'topics/partials/form' }
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @has_voted = @topic.voters.include?(current_user)
    respond_to do |format|
      format.html { render partial: '/topics/partials/topic' }
    end
  end

  def create
    @topic = Topic.new(params[:topic].permit(:title, :category, :description))
    @event = Event.find(params[:event_id])
    @event.talks << @topic
    if @topic.save_with_registerer_and_speakers(current_user, params[:speakers])
      respond_to do |format|
        format.json { render json: @topic, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @current_speakers = @topic.speakers.pluck(:name).map { |x| x }.join(',')
    respond_to do |format|
      format.html { render partial: 'topics/partials/form' }
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_with_speakers(params)
      respond_to do |format|
        format.json { render json: @topic, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    if topic.delete
      redirect_to topics_path
    end
  end

  def topics_list
    event = Event.find_by(name: params[:event_name])
    @topics = event.talks.order('id desc')
    respond_to do |format|
      format.xls
    end
  end

  def vote_for
    topic = Topic.find(params[:id])
    unless topic.voters.include? current_user
      topic.voters << current_user
    end
    render nothing: true, status: :created
  end

  def revoke_vote
    topic = Topic.find(params[:id])
    topic_voters = topic.voters
    topic_voters.each { |voter|
      if voter == current_user
        topic_voters.delete(voter)
      end
    }
    render nothing: true, status: :ok
  end

  private
  def current_event
    Event.find_by(name: params[:event_name])
  end

end
