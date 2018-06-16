require 'test_helper'

class MillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mill = mills(:one)
  end

  test "should get index" do
    get mills_url
    assert_response :success
  end

  test "should get new" do
    get new_mill_url
    assert_response :success
  end

  test "should create mill" do
    assert_difference('Mill.count') do
      post mills_url, params: { mill: { location: @mill.location, name: @mill.name } }
    end

    assert_redirected_to mill_url(Mill.last)
  end

  test "should show mill" do
    get mill_url(@mill)
    assert_response :success
  end

  test "should get edit" do
    get edit_mill_url(@mill)
    assert_response :success
  end

  test "should update mill" do
    patch mill_url(@mill), params: { mill: { location: @mill.location, name: @mill.name } }
    assert_redirected_to mill_url(@mill)
  end

  test "should destroy mill" do
    assert_difference('Mill.count', -1) do
      delete mill_url(@mill)
    end

    assert_redirected_to mills_url
  end
end
