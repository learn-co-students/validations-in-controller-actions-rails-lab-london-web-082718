class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    # Create a brand new, unsaved, not-yet-validated Author object from the form.
    @author = Author.new(author_params)
    # Run the validations WITHOUT attempting to save to the database, returning
    # true if the Author is valid, and false if it's not.
    if @author.valid?
      @author.save
    redirect_to author_path(@author)
  else
    # If the post is invalid, hold on to @author, because it is now full of
      # useful error messages, and re-render the :new page, which knows how
      # to display them alongside the user's entries.
    render :new
    # render can be instructed to render the templates from other actions. In the above code, since we want the :new template from the same controller,
    # we don't have to specify anything except the template name.
    # Remember: redirects incur a new page load. When we redirect after validation failure,
    # we lose the instance of author that has feedback (messages for the user) in its errors attribute
  end
end

  private

  def author_params
    params.permit(:email, :name)
  end
end
