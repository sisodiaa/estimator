require "application_system_test_case"

class MachineBeltsTest < ApplicationSystemTestCase
  setup do
    @machine_belt = machine_belts(:one)
  end

  test "visiting the index" do
    visit machine_belts_url
    assert_selector "h1", text: "Machine Belts"
  end

  test "creating a Machine belt" do
    visit machine_belts_url
    click_on "New Machine Belt"

    fill_in "Belt", with: @machine_belt.belt_id
    fill_in "Length", with: @machine_belt.length
    fill_in "Machine", with: @machine_belt.machine_id
    fill_in "Quantity", with: @machine_belt.quantity
    fill_in "Width", with: @machine_belt.width
    click_on "Create Machine belt"

    assert_text "Machine belt was successfully created"
    click_on "Back"
  end

  test "updating a Machine belt" do
    visit machine_belts_url
    click_on "Edit", match: :first

    fill_in "Belt", with: @machine_belt.belt_id
    fill_in "Length", with: @machine_belt.length
    fill_in "Machine", with: @machine_belt.machine_id
    fill_in "Quantity", with: @machine_belt.quantity
    fill_in "Width", with: @machine_belt.width
    click_on "Update Machine belt"

    assert_text "Machine belt was successfully updated"
    click_on "Back"
  end

  test "destroying a Machine belt" do
    visit machine_belts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Machine belt was successfully destroyed"
  end
end
