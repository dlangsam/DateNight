require 'test_helper'

class DateIdeasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @date_idea = date_ideas(:one)
  end

  test "should get index" do
    get date_ideas_url
    assert_response :success
  end

  test "should get new" do
    get new_date_idea_url
    assert_response :success
  end

  test "should create date_idea" do
    assert_difference('DateIdea.count') do
      post date_ideas_url, params: { date_idea: {  } }
    end

    assert_redirected_to date_idea_url(DateIdea.last)
  end

  test "should show date_idea" do
    get date_idea_url(@date_idea)
    assert_response :success
  end

  test "should get edit" do
    get edit_date_idea_url(@date_idea)
    assert_response :success
  end

  test "should update date_idea" do
    patch date_idea_url(@date_idea), params: { date_idea: {  } }
    assert_redirected_to date_idea_url(@date_idea)
  end

  test "should destroy date_idea" do
    assert_difference('DateIdea.count', -1) do
      delete date_idea_url(@date_idea)
    end

    assert_redirected_to date_ideas_url
  end
end
