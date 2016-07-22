require 'test_helper'

class ChallendesControllerTest < ActionController::TestCase
  setup do
    @challende = challendes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challendes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challende" do
    assert_difference('Challende.count') do
      post :create, challende: {  }
    end

    assert_redirected_to challende_path(assigns(:challende))
  end

  test "should show challende" do
    get :show, id: @challende
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @challende
    assert_response :success
  end

  test "should update challende" do
    patch :update, id: @challende, challende: {  }
    assert_redirected_to challende_path(assigns(:challende))
  end

  test "should destroy challende" do
    assert_difference('Challende.count', -1) do
      delete :destroy, id: @challende
    end

    assert_redirected_to challendes_path
  end
end
