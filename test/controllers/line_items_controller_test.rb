require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get line_items_create_url
    assert_response :success
  end

end
