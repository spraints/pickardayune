class Story < ActiveRecord::Base
  validates :title, :presence => true
  COLUMN = %W(left middle right)
  validates :column, :inclusion => COLUMN
  validates :edition, :format => /^\d\d\d\d-\d\d$/
  serialize :paragraphs, Array

  scope :for_edition, lambda { |date| where(:edition => date.strftime('%Y-%m')) }

  def content_for_edit
    (self.paragraphs || []).join("\n\n")
  end

  def content_for_edit=(content)
    self.paragraphs = content && content.split(/\n\s*\n/)
  end
end
