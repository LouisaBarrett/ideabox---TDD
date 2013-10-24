require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require './lib/app'

class AppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    IdeaboxApp
  end

  def test_create_idea

    # post '/' do
    #   idea = Idea.new(params[:title], params[:description])
    #   IdeaStore.save(idea)
    #   redirect '/'
    # end
    post '/', title: 'costume', description: "scary vampire"

    assert_equal 1, IdeaStore.count

    idea = IdeaStore.all.first
    assert_equal "costume", idea.title
    assert_equal "scary vampire", idea.description
  end

  def test_edit_idea
    id = IdeaStore.save Idea.new('sing', 'happy songs')

      put '/:id' do |id|
      idea = IdeaStore.find(id.to_i)
      idea.title = params[:title]
      idea.description = params[:description]
      IdeaStore.save(idea)
      redirect '/'
    end
    # put "/#{id}", {title: 'yodle', description: 'joyful songs'}

    # assert_equal 302, last_response.status

    # idea = IdeaStore.find(id)
    # assert_equal 'yodle', idea.title
    # assert_equal 'joyful songs', idea.description
  end
end
