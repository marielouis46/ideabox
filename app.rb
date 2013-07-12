require './idea'

class IdeaBoxApp < Sinatra::Base

  configure :development do
  	register Sinatra::Reloader
  end

 get '/' do
    erb :index, locals: {ideas: Idea.all}
  end

  not_found do
  	erb :error
  end

  post '/' do
    idea = Idea.new(params['ideda_title'], params['idea_description'])
  	idea.save
  	redirect '/'
  	"Creating an IDEA!"
  end
end
