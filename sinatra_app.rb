# myapp.rb
require 'sinatra'
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
