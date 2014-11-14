class ClicksController < ApplicationController

  def index

    if params[:month_scope].nil?
      get_clicks
    else
      get_clicks_by_scope(params[:month_scope].to_i.months.ago)
    end

  end


  def show

    @offer = Offer.find_by_token(params[:token])
    Click.create!(:offer_id => @offer.id, :ip => request.remote_ip, :traffic_source => "localhost")

    redirect_to :back

  end

  private

  def get_clicks_by_scope(scope)
    @offers = Offer.by_clicks_created_between(scope, Time.now)
    @sources = Click.created_between(scope, Time.now).group_by(&:traffic_source)
  end

  def get_clicks
    @offers = Offer.all
    @sources = Click.all.group_by(&:traffic_source)
  end
end
