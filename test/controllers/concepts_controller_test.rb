require 'test_helper'

class ConceptsControllerTest < ActionController::TestCase
  setup do
    @concept = concepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concepts)
  end

  test "should be redirected from new when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the page when logged in" do
    sign_in users(:john)
    get :new
    assert_response :success
  end

  test "should be logged in to post a concept" do
    post :create, concept: {title: "Hello", description: 'Hello', body: 'Hello'}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create concept when logged in" do
    sign_in users(:john)
    assert_difference('Concept.count') do
      post :create, concept: { body: @concept.body, description: @concept.description, title: @concept.title }
    end

    assert_redirected_to concept_path(assigns(:concept))
  end

  test "should show concept" do
    get :show, id: @concept
    assert_response :success
  end

  test "should be redirected from get edit when not logged in" do
    get :edit, id: @concept
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:john)
    get :edit, id: @concept
    assert_response :success
  end

  test "should redirect from update concept when not logged in" do
    patch :update, id: @concept, concept: { body: @concept.body, description: @concept.description, title: @concept.title }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get update concept when logged in" do
    sign_in users(:john)
    patch :update, id: @concept, concept: { body: @concept.body, description: @concept.description, title: @concept.title }
    assert_redirected_to concept_path(assigns(:concept))
  end

  test "should destroy concept" do
    assert_difference('Concept.count', -1) do
      delete :destroy, id: @concept
    end

    assert_redirected_to concepts_path
  end
end
