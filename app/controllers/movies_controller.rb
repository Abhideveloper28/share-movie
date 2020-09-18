class MoviesController < ApplicationController
  # before_action :authorized, only: [:new, :create]

  def index
    @user = User.new unless logged_in?
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.new(movie_params)

    if @movie.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:url, :title, :description)
  end
end
