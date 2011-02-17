module EditionHelper
  def render_stories stories, column
    <<-I_HOPE_IT_IS.html_safe
      <div class="#{column} column">
       #{render(:partial => 'story', :collection => stories.select { |s| s.column == column })}
      </div>
    I_HOPE_IT_IS
  end
end
