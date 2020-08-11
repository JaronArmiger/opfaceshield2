require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@first_user = users(:alfonso)
  	@first_user.confirm
  	@second_user = users(:ozuna)
  	@second_user.confirm
    @third_user = users(:natasha)
    @third_user.confirm
    @admin = users(:admin)
    @admin.confirm
  end

  test "should redirect if trying to access other user's posts" do
  	sign_in @first_user
  	first_post = @second_user.posts.first
  	get edit_post_path(first_post)
  	assert_redirected_to root_path
  	patch post_path(first_post)
  	assert_redirected_to root_path
  	delete post_path(first_post)
  	assert_redirected_to root_path
    get root_path
    assert_response :success
  end

  test "user should have access to routes for own post" do
  	sign_in @first_user
  	first_post = @first_user.posts.first
  	get new_post_path
  	assert_response :success
    assert_difference 'Post.count', 1 do
  	  post posts_path, params: { post: { content: "je cherche l'autre cote de la piece" } }
  	end
    assert_not flash.empty?
    assert_redirected_to root_path
  	get post_path(first_post)
  	assert_response :success
  	get edit_post_path(first_post)
  	assert_response :success
    new_content = "j'ai trouve la reponse"
  	patch post_path(first_post), params: { post: { content: new_content } }
    assert_not flash.empty?
    assert_equal first_post.reload.content, new_content
  	assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
  	assert_redirected_to root_path
    assert_not flash.empty?
  end


  test "should redirect if no account set up yet" do
    sign_in @third_user
    assert_nil @third_user.account
    first_post = @first_user.posts.first
    get edit_post_path(first_post)
    assert_redirected_to root_path
    patch post_path(first_post)
    assert_redirected_to root_path
    delete post_path(first_post)
    assert_redirected_to root_path
  end

  test "admin should have access to all routes" do
    sign_in @admin
    first_post = @first_user.posts.first
    get new_post_path
    assert_response :success
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: "je cherche l'autre cote de la piece" } }
    end
    assert_not flash.empty?
    assert_redirected_to root_path
    get post_path(first_post)
    assert_response :success
    get edit_post_path(first_post)
    assert_response :success
    new_content = "j'ai trouve la reponse"
    patch post_path(first_post), params: { post: { content: new_content } }
    assert_not flash.empty?
    assert_equal first_post.reload.content, new_content
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    assert_redirected_to root_path
    assert_not flash.empty?

  end
end
