class TelevisionShowsController < ApplicationController
  def index
    @television_shows = TelevisionShow.all
  end
end
