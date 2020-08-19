class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def profile
   @my_toys = current_user.toys
   @my_offers = current_user.offers
  end
end
