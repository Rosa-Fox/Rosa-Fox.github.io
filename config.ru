require 'tilt'


class MyApp

  def call(env)

    article_filename = "content/index.html"
    template = Tilt.new('views/layout.erb')
    article_content = File.read(article_filename)
    generate_content = template.render { article_content }

    if env['REQUEST_PATH'] == '/'
	  [200, {'Content-Type' => 'text/html'}, [generate_content]]
    else
	  [200, {'Content-Type' => 'text/html'}, ["banana banana banana"]]  
    end
  end
end

run MyApp.new