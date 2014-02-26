# myapp.rb
require 'sinatra'

article_filename = 'content' + '/index.html'
article_content = File.read(article_filename)

get '/' do
  erb article_content
end

def article_exists?(request_path)
  exists_filename = 'content' + request_path
  exists_content = File.read(exists_filename)
  File.exists?('content' + request_path)
  get 'request_path' do
    erb exists_content
  end
end

def call(env)
  if article_exists?(env['REQUEST_PATH'])
    [[article_exists?(env['REQUEST_PATH'])]]
  end
end
