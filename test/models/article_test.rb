require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
  	@article = articles(:one)
  end

  test "should be valid" do
  	assert @article.valid?
  end

  test "url should be present" do
  	@article.url = nil
  	assert_not @article.valid?
  end

  test "title should be present" do
  	@article.title = nil
  	assert_not @article.valid?
  end

  test "img_src should be present" do
  	@article.img_src = nil
  	assert_not @article.valid?
  end
end
