class IntroController < ApplicationController
  def index
    @pages = ["Teams", "Heroes"]
  end
end
