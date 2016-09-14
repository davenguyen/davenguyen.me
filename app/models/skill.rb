class Skill < ApplicationRecord
  has_many :children, class_name: :Skill, foreign_key: :parent_id
  has_and_belongs_to_many :jobs

  belongs_to :parent, class_name: :Skill, optional: true

  default_scope { order(:sequence) }

  scope :categories, -> { where(parent_id: nil) }
  scope :with_children, -> { includes(:children).order('children_skills.sequence') }
end
