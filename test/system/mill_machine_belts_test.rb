require "application_system_test_case"

class MillMachineBeltsTest < ApplicationSystemTestCase
  setup do
    @mill_machine_belt = mill_machine_belts(:one)
  end

  test "visiting the index" do
    visit mill_machine_belts_url
    assert_selector "h1", text: "Mill Machine Belts"
  end

  test "creating a Mill machine belt" do
    visit mill_machine_belts_url
    click_on "New Mill Machine Belt"

    fill_in "Belt", with: @mill_machine_belt.belt_id
    fill_in "Mill Machine", with: @mill_machine_belt.mill_machine_id
    click_on "Create Mill machine belt"

    assert_text "Mill machine belt was successfully created"
    click_on "Back"
  end

  test "updating a Mill machine belt" do
    visit mill_machine_belts_url
    click_on "Edit", match: :first

    fill_in "Belt", with: @mill_machine_belt.belt_id
    fill_in "Mill Machine", with: @mill_machine_belt.mill_machine_id
    click_on "Update Mill machine belt"

    assert_text "Mill machine belt was successfully updated"
    click_on "Back"
  end

  test "destroying a Mill machine belt" do
    visit mill_machine_belts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mill machine belt was successfully destroyed"
  end
end
