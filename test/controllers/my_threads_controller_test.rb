require 'test_helper'

class MyThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_thread = my_threads(:one)
  end

  test "should get index" do
    get my_threads_url
    assert_response :success
  end

  test "should get new" do
    get new_my_thread_url
    assert_response :success
  end

  test "should create my_thread" do
    assert_difference('MyThread.count') do
      post my_threads_url, params: { my_thread: { title: @my_thread.title } }
    end

    assert_redirected_to my_thread_url(MyThread.last)
  end

  test "should show my_thread" do
    get my_thread_url(@my_thread)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_thread_url(@my_thread)
    assert_response :success
  end

  test "should update my_thread" do
    patch my_thread_url(@my_thread), params: { my_thread: { title: @my_thread.title } }
    assert_redirected_to my_thread_url(@my_thread)
  end

  test "should destroy my_thread" do
    assert_difference('MyThread.count', -1) do
      delete my_thread_url(@my_thread)
    end

    assert_redirected_to my_threads_url
  end
end
