class ClicksController < ApplicationController

  def index
    get_clicks(params[:months_scope])
  end


  def show

    @offer = Offer.find_by_token(params[:token])
    Click.create!(:offer_id => @offer.id, :ip => request.remote_ip, :traffic_source => get_traffic_source_from_request)

    redirect_to :back

  end

  private

  def get_clicks(scope)
    if scope.nil?       #default scope - one month
      @offers = Offer.by_clicks_created_between(1.months.ago, Time.now)
      @sources = Click.created_between(1.months.ago, Time.now).group_by(&:traffic_source)
    elsif scope == '0'  #not scoped
      @offers = Offer.all
      @sources = Click.all.group_by(&:traffic_source)
    else
      @offers = Offer.by_clicks_created_between(scope.to_i.months.ago, Time.now)
      @sources = Click.created_between(scope.to_i.months.ago, Time.now).group_by(&:traffic_source)
    end
  end
end
