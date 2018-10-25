require "application_system_test_case"

class MyThreadsTest < ApplicationSystemTestCase
  setup do
    @my_thread = my_threads(:one)
  end

  test "visiting the index" do
    visit my_threads_url
    assert_selector "h1", text: "My Threads"
  end

  test "creating a My thread" do
    visit my_threads_url
    click_on "New My Thread"

    fill_in "Title", with: @my_thread.title
    click_on "Create My thread"

    assert_text "My thread was successfully created"
    click_on "Back"
  end

  test "updating a My thread" do
    visit my_threads_url
    click_on "Edit", match: :first

    fill_in "Title", with: @my_thread.title
    click_on "Update My thread"

    assert_text "My thread was successfully updated"
    click_on "Back"
  end

  test "destroying a My thread" do
    visit my_threads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My thread was successfully destroyed"
  end
end
