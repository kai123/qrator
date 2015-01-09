require 'test_helper'

class QrCodesControllerTest < ActionController::TestCase
  setup do
    @qr_code = qr_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qr_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qr_code" do
    assert_difference('QrCode.count') do
      post :create, qr_code: { campaign: @qr_code.campaign, content: @qr_code.content, medium: @qr_code.medium, qrcode: @qr_code.qrcode, qrlink: @qr_code.qrlink, src: @qr_code.src, term: @qr_code.term, url: @qr_code.url }
    end

    assert_redirected_to qr_code_path(assigns(:qr_code))
  end

  test "should show qr_code" do
    get :show, id: @qr_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qr_code
    assert_response :success
  end

  test "should update qr_code" do
    patch :update, id: @qr_code, qr_code: { campaign: @qr_code.campaign, content: @qr_code.content, medium: @qr_code.medium, qrcode: @qr_code.qrcode, qrlink: @qr_code.qrlink, src: @qr_code.src, term: @qr_code.term, url: @qr_code.url }
    assert_redirected_to qr_code_path(assigns(:qr_code))
  end

  test "should destroy qr_code" do
    assert_difference('QrCode.count', -1) do
      delete :destroy, id: @qr_code
    end

    assert_redirected_to qr_codes_path
  end
end
