require 'tilt'


class MyApp

  def render(filepath)
    article_filename = "content/" + filepath	
    article_content = File.read(article_filename)
    template = Tilt.new('views/layout.erb')
    generate_content = template.render { article_content }
  end


  def call(env)

    if env['REQUEST_PATH'] == '/'
	  [200, {'Content-Type' => 'text/html'}, [render('index.html')]]
    else
	  [200, {'Content-Type' => 'text/html'}, ["banana banana banana"]]  
    end
  end
end

run MyApp.new