require 'test_helper'

class StilagesControllerTest < ActionController::TestCase
  setup do
    @stilage = stilages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stilages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stilage" do
    assert_difference('Stilage.count') do
      post :create, stilage: { room_id: @stilage.room_id }
    end

    assert_redirected_to stilage_path(assigns(:stilage))
  end

  test "should show stilage" do
    get :show, id: @stilage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stilage
    assert_response :success
  end

  test "should update stilage" do
    patch :update, id: @stilage, stilage: { room_id: @stilage.room_id }
    assert_redirected_to stilage_path(assigns(:stilage))
  end

  test "should destroy stilage" do
    assert_difference('Stilage.count', -1) do
      delete :destroy, id: @stilage
    end

    assert_redirected_to stilages_path
  end
end
