class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.new(author_params)
    # Create a brand new, unsaved, not-yet-validated Author object from the form.
    if @author.valid?
      # If--and only if--the post is valid, do what we usually do.
      @author.save
      redirect_to author_path(@author)
    else
      # If the author is invalid, hold on to @author, because it is now full of
      # useful error messages, and re-render the :new page, which knows how
      # to display them alongside the user's entries.
      render :new
    end
  end 

  private

  def author_params
    params.permit(:email, :name)
  end
end
