require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success

	# remember  the following tests are based on the products fixtures
    assert_select  '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 2.0'
    assert_select '.price', /\$[,\d]+\.\d\d/


  end

end
