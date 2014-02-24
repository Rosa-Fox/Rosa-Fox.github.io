require 'tilt'
# App to serve web pages on the fly
class MyApp
  def render(filepath)
    article_filename = 'content' + filepath
    article_content = File.read(article_filename)
    template = Tilt.new('views/layout.erb')
    template.render { article_content }
  end

  # call using generate content = new-method-name("index.html")

  def article_exists?(request_path)
    File.exists?('content' + request_path)
  end
  # call using if article_exists?(env['REQUEST_PATH'])

  def img_exists?(imgpath)
    File.exists?('img' + imgpath)
  end

  def call(env)
    if env['REQUEST_PATH'] == '/'
      [200, { 'Content-Type' => 'text/html' }, [render('/index.html')]]

    elsif article_exists?(env['REQUEST_PATH'])
      [200, { 'Content-Type' => 'text/html' }, [render(env['REQUEST_PATH'])]]

    elsif env['REQUEST_PATH'] == '/style.css'
      [200, { 'Content-Type' => 'text/css' }, [File.read('style.css')]]

    elsif img_exists?(env['REQUEST_PATH'])
      [200, { 'Content-Type' => 'img/jpeg' }, [render(env['REQUEST_PATH'])]]

    else
      [404, {}, ['Not Found']]

    end
  end
end

run MyApp.new
