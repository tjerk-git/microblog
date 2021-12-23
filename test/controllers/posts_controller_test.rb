require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_1)
    post user_session_url

    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { body: @post.body, title: 'uniquetitle' } }
    end

    assert_redirected_to post_url(Post.last.slug)
  end

  test "should show post" do
    get post_url(@post.slug)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post.slug)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post.slug), params: { post: { body: @post.body, slug: @post.slug, title: @post.title } }
    assert_redirected_to post_url(@post.slug)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post.slug)
    end

    assert_redirected_to posts_url
  end
end
