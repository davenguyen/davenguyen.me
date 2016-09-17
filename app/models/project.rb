class Project < ApplicationRecord
  has_many :project_skills
  has_many :skills, through: :project_skills

  def highlighted_skills
    skills.order('project_skills.sequence').limit(10)
  end
end
