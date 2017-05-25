require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "YourMotivationApp"
  end

   test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "HOME | #{@base_title}"
  end

  test "should get plan" do
    get plan_path
    assert_response :success
    assert_select "title", "PLAN | #{@base_title}"
  end

  test "should get nutrition" do
    get nutrition_path
    assert_response :success
    assert_select "title", "NUTRITION | #{@base_title}"
  end

  test "should get motivation" do
    get motivation_path
    assert_response :success
    assert_select "title", "MOTIVATION | #{@base_title}"
  end

  test "should get gallery" do
    get gallery_path
    assert_response :success
    assert_select "title", "GALLERY | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "CONTACT | #{@base_title}"
  end

end