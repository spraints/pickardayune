require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra/base'
require 'haml'

module PickardAyune

class App < Sinatra::Base
  get '/style.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass :style
  end

  get '/' do
    redirect('/%d/%02d' % [Time.now.year, Time.now.month])
  end

  get '/:year/:month' do
    year  = params[:year].to_i
    month = params[:month].to_i
    if year < 2010 || (year == 2010 && month < 7)
      redirect '/'
    elsif year > Time.now.year || (year == Time.now.year && month > Time.now.month)
      redirect '/'
    else
      template = ('%4d-%02d' % [year, month]).to_sym
      if File.exist? "views/#{template}.haml"
        haml template
      else
        m = year * 12 + month - 2
        new_year  = m / 12
        new_month = m % 12 + 1
        redirect('/%d/%02d' % [new_year, new_month])
      end
    end
  end
end

end
