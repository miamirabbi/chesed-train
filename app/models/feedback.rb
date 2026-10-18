class Feedback < ApplicationRecord
  CATEGORIES = %w[issue feedback].freeze

  belongs_to :user, optional: true

  validates :message, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  before_validation :normalize_category

  scope :recent, -> { order(created_at: :desc) }
  scope :issues, -> { where(category: 'issue') }
  scope :feedback_only, -> { where(category: 'feedback') }

  def display_category
    category.to_s.humanize
  end

  private

  def normalize_category
    self.category = CATEGORIES.include?(category.to_s.downcase) ? category.to_s.downcase : 'feedback'
  end
end
