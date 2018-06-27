require 'test_helper'

class MillMachineBeltsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mill_machine_belt = mill_machine_belts(:one)
  end

  test "should get index" do
    get mill_machine_belts_url
    assert_response :success
  end

  test "should get new" do
    get new_mill_machine_belt_url
    assert_response :success
  end

  test "should create mill_machine_belt" do
    assert_difference('MillMachineBelt.count') do
      post mill_machine_belts_url, params: { mill_machine_belt: { belt_id: @mill_machine_belt.belt_id, mill_machine_id: @mill_machine_belt.mill_machine_id } }
    end

    assert_redirected_to mill_machine_belt_url(MillMachineBelt.last)
  end

  test "should show mill_machine_belt" do
    get mill_machine_belt_url(@mill_machine_belt)
    assert_response :success
  end

  test "should get edit" do
    get edit_mill_machine_belt_url(@mill_machine_belt)
    assert_response :success
  end

  test "should update mill_machine_belt" do
    patch mill_machine_belt_url(@mill_machine_belt), params: { mill_machine_belt: { belt_id: @mill_machine_belt.belt_id, mill_machine_id: @mill_machine_belt.mill_machine_id } }
    assert_redirected_to mill_machine_belt_url(@mill_machine_belt)
  end

  test "should destroy mill_machine_belt" do
    assert_difference('MillMachineBelt.count', -1) do
      delete mill_machine_belt_url(@mill_machine_belt)
    end

    assert_redirected_to mill_machine_belts_url
  end
end
