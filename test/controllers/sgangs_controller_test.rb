require "test_helper"

class SgangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sgang = sgangs(:one)
  end

  test "should get index" do
    get sgangs_url
    assert_response :success
  end

  test "should get new" do
    get new_sgang_url
    assert_response :success
  end

  test "should create sgang" do
    assert_difference("Sgang.count") do
      post sgangs_url, params: { sgang: { facebook: @sgang.facebook, first_name: @sgang.first_name, last_name: @sgang.last_name, phone: @sgang.phone } }
    end

    assert_redirected_to sgang_url(Sgang.last)
  end

  test "should show sgang" do
    get sgang_url(@sgang)
    assert_response :success
  end

  test "should get edit" do
    get edit_sgang_url(@sgang)
    assert_response :success
  end

  test "should update sgang" do
    patch sgang_url(@sgang), params: { sgang: { facebook: @sgang.facebook, first_name: @sgang.first_name, last_name: @sgang.last_name, phone: @sgang.phone } }
    assert_redirected_to sgang_url(@sgang)
  end

  test "should destroy sgang" do
    assert_difference("Sgang.count", -1) do
      delete sgang_url(@sgang)
    end

    assert_redirected_to sgangs_url
  end
end
