class ClicksController < ApplicationController

  def index
    #@clicks = Click.all
    @offers = Offer.all
  end


  def show

    @offer = Offer.find_by_token(params[:token])
    Click.create!(:offer_id => @offer.id, :ip => request.remote_ip)

    redirect_to :back

  end
end
