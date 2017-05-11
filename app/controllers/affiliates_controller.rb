class AffiliatesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  # before_action :find_student

  def search
    if params[:search].present?
      @affiliates = Affiliate.search(params[:search])
    else
      @affiliates = Affiliate.all
    end
  end

  def index
    @affiliates = Affiliate.all
  end

  def show
    @affiliate = Affiliate.find(params[:id])
  end

  def new
    @affiliate = current_user.affiliates.build
  end

  def create
    @affiliate = current_user.affiliates.build(affiliate_params)
    @affiliate.user = current_user
    if @affiliate.save
      redirect_to(affiliates_path)
    else
      render('new')
    end
  end

  def edit
    @affiliate = Affiliate.find(params[:id])
  end

  def update
    @affiliate = Affiliate.find(params[:id])
    if @affiliate.update_attributes(affiliate_params)
      redirect_to(affiliate_path(@affiliate))
    else
      render('edit')
    end
  end

  def delete
    @affiliate = Affiliate.find(params[:id])
  end

  def destroy
    @affiliate = Affiliate.find(params[:id])
    @affiliate.destroy
    redirect_to(affiliates_path)
  end

  private

  def affiliate_params
    params.require(:affiliate).permit(
      :title,
      :about,
      :phone_number,
      :email,
      :address,
      :suburb,
      :postcode,
      :annual_fee,
      :category,
      :user_id)
  end

end
