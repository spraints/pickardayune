puts "Creating an admin account for @spraints"
Omnisocial::TwitterAccount.create! :remote_account_id => 14919968,
  :user_id => User.create!(:role => 'admin')
puts "Creating an admin account for @farmingengineer"
Omnisocial::TwitterAccount.create! :remote_account_id => 27855975,
  :user_id => User.create!(:role => 'admin')

(Rails.root + 'db/seed/old_stories').children.select{|x| x.file?}.each do |file|
  edition = file.basename('.haml').to_s
  puts "Loading #{edition}..."
  current_story = nil
  current_column = nil
  file.each_line do |line|
    case line
    when /@date\s*=/
      #ignore
    when /\.(.*)\.column/
      current_column = $1
      current_story.save! if current_story
      current_story = nil
    when /\.story/
      current_story.save! if current_story
      current_story = Story.new :edition => edition, :column => current_column
    when /%h[34] (.*)/
      current_story.title = $1.strip
    when /%p (.*)/
      (current_story.paragraphs ||= []) << $1.strip
    else
      puts "UNHANDLED: #{line.strip}"
    end
  end
  current_story.save! if current_story
end
