require 'tilt'


class MyApp

  def render(filepath)
    article_filename = "content" + filepath	
    article_content = File.read(article_filename)
    template = Tilt.new('views/layout.erb')
    template.render { article_content } 
  end

  #call using generate content = new-method-name("index.html")

  def article_exists?(request_path)
    File.exists?("content" + request_path)
  end
  #call using if article_exists?(env['REQUEST_PATH'])

  def call(env)

    if env['REQUEST_PATH'] == '/'
	  [200, {'Content-Type' => 'text/html'}, [render('/index.html')]]

    elsif article_exists?(env['REQUEST_PATH'])
	  [200, {'Content-Type' => 'text/html'}, [render(env['REQUEST_PATH'])]]
    end
  end
end

run MyApp.new