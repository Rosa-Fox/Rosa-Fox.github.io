# myapp.rb
require 'sinatra'

get '/' do
  article_filename = 'content' + '/index.html'
  article_content = File.read(article_filename)
  erb article_content
end

def article_exists?(request_path)
  File.exists?('content' + request_path)
end

get '/:page' do
  pass params[:page] = article_exists?
  article_filename = 'content'
  article_content = File.read(article_filename)
  erb article_content
end

