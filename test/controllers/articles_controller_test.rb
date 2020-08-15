require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@first_user = users(:alfonso)
  	@first_user.confirm
  	@second_user = users(:ozuna)
  	@second_user.confirm
  	@admin = users(:admin)
  	@admin.confirm
  end

  test "no routes except index should be accessible if no user signed in" do
  	get articles_path
  	assert_response success
    assert_template :index
  	get new_article_path
  	assert_redirected_to new_user_session_path
  	article = articles(:one)
  	get article_path(article)
  	assert_redirected_to new_user_session_path
  	get edit_article_path(article)
  	assert_redirected_to new_user_session_path
  	post articles_path
  	assert_redirected_to new_user_session_path
  	patch article_path(article)
  	assert_redirected_to new_user_session_path
  	delete article_path(article)
  	assert_redirected_to new_user_session_path
  end

  test "non-admin can only access index, show" do
  	
  end
end
