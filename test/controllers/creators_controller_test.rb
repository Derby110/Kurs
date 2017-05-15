require 'test_helper'

class CreatorsControllerTest < ActionController::TestCase
  setup do
    @creator = creators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:creators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create creator" do
    assert_difference('Creator.count') do
      post :create, creator: { first_name: @creator.first_name, last_name: @creator.last_name, second_name: @creator.second_name }
    end

    assert_redirected_to creator_path(assigns(:creator))
  end

  test "should show creator" do
    get :show, id: @creator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @creator
    assert_response :success
  end

  test "should update creator" do
    patch :update, id: @creator, creator: { first_name: @creator.first_name, last_name: @creator.last_name, second_name: @creator.second_name }
    assert_redirected_to creator_path(assigns(:creator))
  end

  test "should destroy creator" do
    assert_difference('Creator.count', -1) do
      delete :destroy, id: @creator
    end

    assert_redirected_to creators_path
  end
end
