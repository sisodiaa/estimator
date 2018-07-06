require 'test_helper'

class MachineBeltsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machine_belt = machine_belts(:one)
  end

  test "should get index" do
    get machine_belts_url
    assert_response :success
  end

  test "should get new" do
    get new_machine_belt_url
    assert_response :success
  end

  test "should create machine_belt" do
    assert_difference('MachineBelt.count') do
      post machine_belts_url, params: { machine_belt: { belt_id: @machine_belt.belt_id, length: @machine_belt.length, machine_id: @machine_belt.machine_id, quantity: @machine_belt.quantity, width: @machine_belt.width } }
    end

    assert_redirected_to machine_belt_url(MachineBelt.last)
  end

  test "should show machine_belt" do
    get machine_belt_url(@machine_belt)
    assert_response :success
  end

  test "should get edit" do
    get edit_machine_belt_url(@machine_belt)
    assert_response :success
  end

  test "should update machine_belt" do
    patch machine_belt_url(@machine_belt), params: { machine_belt: { belt_id: @machine_belt.belt_id, length: @machine_belt.length, machine_id: @machine_belt.machine_id, quantity: @machine_belt.quantity, width: @machine_belt.width } }
    assert_redirected_to machine_belt_url(@machine_belt)
  end

  test "should destroy machine_belt" do
    assert_difference('MachineBelt.count', -1) do
      delete machine_belt_url(@machine_belt)
    end

    assert_redirected_to machine_belts_url
  end
end
