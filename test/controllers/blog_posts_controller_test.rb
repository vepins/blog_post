require 'test_helper'

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get blog_posts_edit_url
    assert_response :success
  end

  test "should get new" do
    get blog_posts_new_url
    assert_response :success
  end

end
