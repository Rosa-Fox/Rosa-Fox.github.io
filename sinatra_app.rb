# myapp.rb
require 'sinatra'

get '/' do
  article_filename = local_path('index.html')
  article_content = File.read(article_filename)
  erb article_content
end

#Checks that article exists... needs an argument to be fed into it (:page)
def article_exists?(request_path)
  File.exists? local_path(request_path)
end

get '/:page' do
  #Need to check that the file exists in the directory by calling article_exists?
  page = params[:page]
  pass unless article_exists?(page)
  #If the file exists then render it... not sure if symbol will convert to a string for the filepath...:
  exists_filename = local_path(page)
  exists_content = File.read(exists_filename)
  erb exists_content
end

def local_path(file_name)
   'content/' + file_name 
end
