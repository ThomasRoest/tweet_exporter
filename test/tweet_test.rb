require 'test_helper'

class TweetTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tweet::VERSION
  end

  def create_tweet_object
    # assert true
    obj = Tweet::Favorite.new(text: "hello", url: "hello")
    assert_equal obj.text, "hello"

  end
end
