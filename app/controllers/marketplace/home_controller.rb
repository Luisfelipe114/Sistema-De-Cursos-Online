class Marketplace::HomeController < ApplicationController
  def index
    @courses = Sales::Course.all
  end
end
