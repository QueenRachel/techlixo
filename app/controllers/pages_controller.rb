class PagesController < ApplicationController
  def homepage
    # Get the newest 6 businesses created
    @businesses = Business.order(created_at: :desc).limit(6)
  end
end
