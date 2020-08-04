require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@post = posts(:one)
  	@user = users(:alfonso)
  end

  test "should be valid" do
  	assert @post.valid?
  end

  test "content should be <= 140 chars" do
  	@post.content = "w" * 141
  	assert_not @post.valid?
  end
end
