class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def profile
    @my_toys = current_user.toys
    @my_offers = current_user.offers
  end

  def bookings
    @my_offers = current_user.offers
    @toy_requests = []
    current_user.toys.each do |toy|
      toy.offers.each do |offer|
        @toy_requests << offer
      end
    end
  end
end
