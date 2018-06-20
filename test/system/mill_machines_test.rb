require "application_system_test_case"

class MillMachinesTest < ApplicationSystemTestCase
  setup do
    @mill_machine = mill_machines(:one)
  end

  test "visiting the index" do
    visit mill_machines_url
    assert_selector "h1", text: "Mill Machines"
  end

  test "creating a Mill machine" do
    visit mill_machines_url
    click_on "New Mill Machine"

    fill_in "Machine", with: @mill_machine.machine_id
    fill_in "Mill", with: @mill_machine.mill_id
    fill_in "Units", with: @mill_machine.units
    click_on "Create Mill machine"

    assert_text "Mill machine was successfully created"
    click_on "Back"
  end

  test "updating a Mill machine" do
    visit mill_machines_url
    click_on "Edit", match: :first

    fill_in "Machine", with: @mill_machine.machine_id
    fill_in "Mill", with: @mill_machine.mill_id
    fill_in "Units", with: @mill_machine.units
    click_on "Update Mill machine"

    assert_text "Mill machine was successfully updated"
    click_on "Back"
  end

  test "destroying a Mill machine" do
    visit mill_machines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mill machine was successfully destroyed"
  end
end
