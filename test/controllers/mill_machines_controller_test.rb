require 'test_helper'

class MillMachinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mill_machine = mill_machines(:one)
  end

  test "should get index" do
    get mill_machines_url
    assert_response :success
  end

  test "should get new" do
    get new_mill_machine_url
    assert_response :success
  end

  test "should create mill_machine" do
    assert_difference('MillMachine.count') do
      post mill_machines_url, params: { mill_machine: { machine_id: @mill_machine.machine_id, mill_id: @mill_machine.mill_id, units: @mill_machine.units } }
    end

    assert_redirected_to mill_machine_url(MillMachine.last)
  end

  test "should show mill_machine" do
    get mill_machine_url(@mill_machine)
    assert_response :success
  end

  test "should get edit" do
    get edit_mill_machine_url(@mill_machine)
    assert_response :success
  end

  test "should update mill_machine" do
    patch mill_machine_url(@mill_machine), params: { mill_machine: { machine_id: @mill_machine.machine_id, mill_id: @mill_machine.mill_id, units: @mill_machine.units } }
    assert_redirected_to mill_machine_url(@mill_machine)
  end

  test "should destroy mill_machine" do
    assert_difference('MillMachine.count', -1) do
      delete mill_machine_url(@mill_machine)
    end

    assert_redirected_to mill_machines_url
  end
end
