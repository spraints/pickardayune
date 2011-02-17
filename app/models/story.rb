class Story < ActiveRecord::Base
  validates :title, :presence => true
  COLUMN_CHOICES = %W(left middle right)
  validates :column, :inclusion => COLUMN_CHOICES
  validates :edition, :format => /^\d\d\d\d-\d\d$/
  serialize :paragraphs, Array

  scope :for_edition, lambda { |date| where(:edition => date.strftime('%Y-%m')) }
end
