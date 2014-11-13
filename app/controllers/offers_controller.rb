class OffersController < ApplicationController

  def index
    if params[:destination] == ""
      @offers = Offer.all
    else
      @offers = Offer.find_all_by_city(params[:destination])
    end

    @offers = Offer.all if @offers.empty?

    render :json => @offers.to_json, :callback => params['callback']

  end

  def show
    @offer = Offer.find(params[:id])

    render json: @offer
  end

  def create
    @offer = Offer.new(params[:offer])

    if @offer.save
      render json: @offer, status: :created, location: @offer
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update_attributes(params[:offer])
      head :no_content
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    head :no_content
  end

end
