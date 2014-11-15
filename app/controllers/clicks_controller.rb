class ClicksController < ApplicationController

  def index

    if params[:months_scope].nil?
      get_clicks_by_scope(1.months.ago) #default scope - one month
    elsif params[:months_scope] == '0'     #not scoped
      get_clicks
    else
      get_clicks_by_scope(params[:months_scope].to_i.months.ago)
    end

  end


  def show

    @offer = Offer.find_by_token(params[:token])
    Click.create!(:offer_id => @offer.id, :ip => request.remote_ip, :traffic_source => get_host_from_uri)

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
