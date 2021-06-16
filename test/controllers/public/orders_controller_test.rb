require 'test_helper'

class Public::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_orders_show_url
    assert_response :success
  end

  test "should get cofirm" do
    get public_orders_cofirm_url
    assert_response :success
  end

  test "should get index" do
    get public_orders_index_url
    assert_response :success
  end

  test "should get after" do
    get public_orders_after_url
    assert_response :success
  end

  test "should get new" do
    get public_orders_new_url
    assert_response :success
  end

end
