class PublicController < ApplicationController

	# layout 'public'

  def index
  	# intro text
    @affiliates = Affiliate.all
  end

  def show
    @affiliate = Affiliate.where(:title => params[:title]).first
    if @affiliate.nil?
      redirect_to(root_path)
    else
      # display the page content using show.html.erb
    end
  end

end
