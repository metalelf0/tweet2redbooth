class TwitterController < ApplicationController

  def index
    unless session['redbooth_token']
      flash[:alert] = "You must be authenticated on Redbooth to see tweets"
      redirect_to :root 
    end
    @redbooth_token = session['redbooth_token']
    # @projects      = RestClient.get(
      # 'https://redbooth.com/api/3/projects',
      # params: { 
        # access_token: @redbooth_token,
        # order: 'id',
        # archived: 'false'
      # }
    # )
    @running       = ServicePool.running?(current_user)
    @latest_tweets = current_user.tweet_events.last(10)
  end

  def start
    keyword = params[:keyword]
    if ServicePool.running?(current_user)
      flash[:alert] = "Your service is already running, please kill it before starting a new search"
    else
      ServicePool.run(current_user, [ keyword ])
      flash[:notice] = "Service started, fetching tweets..."
    end
    redirect_to url_for(action: :index)
  end

  def stop
    if ServicePool.running?(current_user)
      ServicePool.stop(current_user)
      flash[:notice] = "Service killed"
    else
      flash[:alert] = "Cannot kill service, please make sure you start it before killing it :)"
    end
    redirect_to url_for(action: :index)
  end
end
