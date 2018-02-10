require 'test_helper'

class GymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gyms_index_url
    assert_response :success
  end

  test "should get new" do
    get gyms_new_url
    assert_response :success
  end

  test "should get create" do
    get gyms_create_url
    assert_response :success
  end

  test "should get listing" do
    get gyms_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get gyms_pricing_url
    assert_response :success
  end

  test "should get description" do
    get gyms_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get gyms_photo_upload_url
    assert_response :success
  end

  test "should get amenities" do
    get gyms_amenities_url
    assert_response :success
  end

  test "should get location" do
    get gyms_location_url
    assert_response :success
  end

  test "should get update" do
    get gyms_update_url
    assert_response :success
  end

end
