class Job < ApplicationRecord
  has_many :job_skills
  has_many :skills, through: :job_skills

  def highlighted_skills
    skills.order('job_skills.sequence').limit(10)
  end
end
