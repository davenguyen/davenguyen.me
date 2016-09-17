class Skill < ApplicationRecord
  has_many :children, class_name: :Skill, foreign_key: :parent_id
  has_many :job_skills
  has_many :jobs, through: :job_skills
  has_many :project_skills
  has_many :projects, through: :project_skills

  belongs_to :parent, class_name: :Skill, optional: true

  default_scope { order(:sequence) }

  scope :categories, -> { where(parent_id: nil) }
  scope :with_children, -> { includes(:children).order('children_skills.sequence') }
end
