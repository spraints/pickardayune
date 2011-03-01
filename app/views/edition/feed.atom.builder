atom_feed do |feed|
  feed.title 'Pickard Ayune'
  feed.updated @stories.first.created_at

  @stories.each do |story|
    feed.entry(story) do |entry|
      entry.author do |a|
        a.name 'Pickard Ayune staff writer'
      end
      entry.title story.title
      entry.content story_content(story), :type => 'html'
    end
  end
end
