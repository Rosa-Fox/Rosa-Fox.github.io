# myapp.rb
require 'sinatra'

#Bring back the article exists method and pass if the requested article doesn't exist 
#Needs 2 get calls to register routes
#Start with just / to register the index 
#Use built in ERB method to render
#Pass the content of the file you want to render to erb method will magically render

article_filename = 'content' + '/index.html'
article_content = File.read(article_filename)


get '/' do
  erb article_content
end


