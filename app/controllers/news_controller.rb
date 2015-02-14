class NewsController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
    @news = News.order(created_at: :desc)
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    news_params = params.require(:news).permit(:title, :body)
    @news.update(news_params)
    redirect_to @news
  end

  def new
    @news = News.new
  end

  def create
    news_params = params.require(:news).permit(:title, :body)
    @news = News.new(news_params)
    @news.save
    redirect_to @news
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to @news
  end
end
