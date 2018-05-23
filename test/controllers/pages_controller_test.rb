require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get about_company" do
    get pages_about_company_url
    assert_response :success
  end

  test "should get info" do
    get pages_info_url
    assert_response :success
  end

end
