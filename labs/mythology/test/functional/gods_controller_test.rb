require 'test_helper'

class GodsControllerTest < ActionController::TestCase
  setup do
    @god = gods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create god" do
    assert_difference('God.count') do
      post :create, god: { description: @god.description, name: @god.name }
    end

    assert_redirected_to god_path(assigns(:god))
  end

  test "should show god" do
    get :show, id: @god
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @god
    assert_response :success
  end

  test "should update god" do
    put :update, id: @god, god: { description: @god.description, name: @god.name }
    assert_redirected_to god_path(assigns(:god))
  end

  test "should destroy god" do
    assert_difference('God.count', -1) do
      delete :destroy, id: @god
    end

    assert_redirected_to gods_path
  end
end
