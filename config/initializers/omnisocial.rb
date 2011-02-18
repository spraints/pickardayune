Omnisocial.setup do |config|
  
  # ==> Twitter
  # config.twitter 'APP_KEY', 'APP_SECRET'
  
  # ==> Facebook
  # config.facebook 'APP_KEY', 'APP_SECRET', :scope => 'publish_stream'
  
  if Rails.env.production?
    
    # Configs for production mode go here
    config.twitter ENV['TWITTER_APP_KEY'], ENV['TWITTER_APP_SECRET']
    
  elsif Rails.env.development?
    
    begin
      keys = YAML::load open(Pickardayune::Application.config.root + '.omnisocial.yml')
      keys.each do |provider, keys|
        config.send provider, *keys
      end
    rescue => e
      puts "NO OMNISOCIAL CONFIGURATION HAS BEEN DONE!"
      puts "Unable to load omnisocial config from .omnisocial.yml. Example:"
      puts "  twitter: [ 'appkey', 'appsecret' ]"
      puts "  facebook: [ 'appkey', 'appsecret', { :scope: publish_stream } ]"
      puts e
    end

  end
  
end
