require "application_system_test_case"

class MillsTest < ApplicationSystemTestCase
  setup do
    @mill = mills(:one)
  end

  test "visiting the index" do
    visit mills_url
    assert_selector "h1", text: "Mills"
  end

  test "creating a Mill" do
    visit mills_url
    click_on "New Mill"

    fill_in "Location", with: @mill.location
    fill_in "Name", with: @mill.name
    click_on "Create Mill"

    assert_text "Mill was successfully created"
    click_on "Back"
  end

  test "updating a Mill" do
    visit mills_url
    click_on "Edit", match: :first

    fill_in "Location", with: @mill.location
    fill_in "Name", with: @mill.name
    click_on "Update Mill"

    assert_text "Mill was successfully updated"
    click_on "Back"
  end

  test "destroying a Mill" do
    visit mills_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mill was successfully destroyed"
  end
end
