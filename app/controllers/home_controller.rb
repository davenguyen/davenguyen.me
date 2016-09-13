class HomeController < ApplicationController
  def index
  end

  private

  def jobs
    @jobs ||= Job.order(start_date: :desc).all
  end
  helper_method :jobs
end
