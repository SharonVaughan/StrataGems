class MeetingsController < ApplicationController

  before_action :find_affiliate

  def index
    @meetings = @affiliate.meetings.sorted
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new(:affiliate_id => @affiliate.id)
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.affiliate_id = :affiliate.id
    if @meeting.save
      redirect_to(meetings_path(:affiliate_id => @affiliate.id))
    else
      render('new')
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update_attributes(meeting_params)
      redirect_to(meetings_path(@meeting))
    else
      render('edit')
    end
  end

  def delete
    @meeting = Meeting.find(params[:id])
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to(meetings_path)
  end

  private

  def meeting_params
    params.require(:meeting).permit(
      :affiliate_id,
      :title,
      :blurb,
      :address,
      :suburb,
      :postcode)
  end

  def find_affiliate
    @affiliate = Affiliate.find(params[:affiliate_id => @affiliate.id])
  end

end
