require "application_system_test_case"

class PostTypesTest < ApplicationSystemTestCase
  setup do
    @post_type = post_types(:one)
  end

  test "visiting the index" do
    visit post_types_url
    assert_selector "h1", text: "Post types"
  end

  test "should create post type" do
    visit post_types_url
    click_on "New post type"

    click_on "Create Post type"

    assert_text "Post type was successfully created"
    click_on "Back"
  end

  test "should update Post type" do
    visit post_type_url(@post_type)
    click_on "Edit this post type", match: :first

    click_on "Update Post type"

    assert_text "Post type was successfully updated"
    click_on "Back"
  end

  test "should destroy Post type" do
    visit post_type_url(@post_type)
    click_on "Destroy this post type", match: :first

    assert_text "Post type was successfully destroyed"
  end
end
