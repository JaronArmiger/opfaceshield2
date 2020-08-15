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
  	assert_response :success
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
  	sign_in @first_user

    get articles_path
    assert_response :success
    assert_template :index
    get new_article_path
    assert_redirected_to root_path
    article = articles(:one)
    get article_path(article)
    assert_response :success
    assert_template :show
    get edit_article_path(article)
    assert_redirected_to root_path
    post articles_path
    assert_redirected_to root_path
    patch article_path(article)
    assert_redirected_to root_path
    delete article_path(article)
    assert_redirected_to root_path
  end

  test "admin can access all routes" do
    sign_in @admin

    get articles_path
    assert_response :success
    assert_template :index

    get new_article_path
    assert_response :success
    assert_template :new

    article = articles(:one)
    get article_path(article)
    assert_response :success
    assert_template :show

    get edit_article_path(article)
    assert_response :success
    assert_template :edit

    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {
        url: "https://www.wired.com/story/youre-not-alone-how-one-nurse-is-confronting-pandemic/",
        title: "‘You’re Not Alone’: How One Nurse Is Confronting the Pandemic",
        img_src: "https://media.wired.com/photos/5ebf2cfbda42f39db947dfaa/master/w_2560c_limit/Backchannel-Hospital-3_405.jpg"
      }}
    end
    assert_redirected_to articles_path

    new_url = "new_url"
    patch article_path(article), params: { article: { url: new_url } }
    assert_not flash.empty?
    assert_equal article.reload.url, new_url
    assert_redirected_to articles_path
    follow_redirect!
    assert_not flash.empty?
    
    assert_difference 'Article.count', -1 do
      delete article_path(article)
    end
    assert_redirected_to articles_path
    follow_redirect!
    assert_not flash.empty?

  end
end
