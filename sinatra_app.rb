# myapp.rb
require 'sinatra'
require 'bundler/setup'
require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.gmail.com',
    :port => '587',
    :domain => 'http://vast-wildwood-6547.herokuapp.com/',
    :user_name => ENV['app22568285@heroku.com'],
    :password => ENV['k9d9ncua'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

def article_exists?(request_path)
  File.exists? local_path(request_path)
end

def local_path(file_name)
  'content/' + file_name
end

get '/' do
  article_filename = local_path('index.html')
  article_content = File.read(article_filename)
  erb article_content
end

get '/:page' do
  page = params[:page]
  pass unless article_exists?(page)
  exists_filename = local_path(page)
  exists_content = File.read(exists_filename)
  erb exists_content
end

#post '/contact.html' do
  #{}"#{params[:email]}<br>#{params[:message]}"
#end

#Send an email
post '/contact.html' do
  mail = Mail.new.tap do |m|
    m.to = 'rosafox89@gmail.com'
    m.from = "#{params[:email]}"
    m.subject = 'You been contacted'
    m.body = "#{params[:message]}"
  end
mail.deliver  
end
