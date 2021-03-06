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
    if @news.update(news_params)
      flash[:success] = "News item successfully updated!"
      redirect_to @news
    else
      flash[:danger] = @news.errors.full_messages.to_sentence
      render @news
    end
  end

  def new
    @news = News.new
  end

  def create
    news_params = params.require(:news).permit(:title, :body)
    @news = News.new(news_params)
    if @news.save
      flash[:success] = "News item successfully created!"
      redirect_to @news
    else
      flash[:danger] = @news.errors.full_messages.to_sentence
      redirect_to @news
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    flash[:danger] = "News item deteled!"
    redirect_to @news
  end
end
