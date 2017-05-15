require 'test_helper'

class BookCreatorsControllerTest < ActionController::TestCase
  setup do
    @book_creator = book_creators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_creators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_creator" do
    assert_difference('BookCreator.count') do
      post :create, book_creator: { book_id: @book_creator.book_id, creator_id: @book_creator.creator_id }
    end

    assert_redirected_to book_creator_path(assigns(:book_creator))
  end

  test "should show book_creator" do
    get :show, id: @book_creator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_creator
    assert_response :success
  end

  test "should update book_creator" do
    patch :update, id: @book_creator, book_creator: { book_id: @book_creator.book_id, creator_id: @book_creator.creator_id }
    assert_redirected_to book_creator_path(assigns(:book_creator))
  end

  test "should destroy book_creator" do
    assert_difference('BookCreator.count', -1) do
      delete :destroy, id: @book_creator
    end

    assert_redirected_to book_creators_path
  end
end
