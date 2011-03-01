module EditionHelper
  def column column, all_stories
    stories = all_stories.select { |s| s.column == column }
    render :partial => 'column', :locals => { :stories => stories, :column => column }
  end

  def story_content story
    render :partial => 'story_content.html.haml', :locals => { :story => story }
  end

  def story_url story
    edition_url story.year, story.month
  end
end
