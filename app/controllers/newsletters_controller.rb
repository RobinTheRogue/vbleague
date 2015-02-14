class NewslettersController < ApplicationController
  # before_filter :authenticate_admin!, except: [ :index ]
  before_filter :except => :index do
    redirect_to root_path unless current_admin
  end

  def index
    @newsletter = Newsletter.order(published_on: :desc)
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    @newsletter.update(newsletter_params)
    redirect_to @newsletter
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.save
    redirect_to @newsletter
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to @newsletter
  end

private
  def newsletter_params
    params.require(:newsletter).permit(:title, :body, :published_on)
  end

end
