class HomeController < ApplicationController
  def index
  end

  private

  def jobs
    @jobs ||= Job.order(start_date: :desc).all
  end
  helper_method :jobs

  def projects
    @projects ||= Project.order(project_year: :desc, name: :asc).all
  end
  helper_method :projects

  def categories
    @categories ||= Skill.categories.with_children
  end
  helper_method :categories
end
