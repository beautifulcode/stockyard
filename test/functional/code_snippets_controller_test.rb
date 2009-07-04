require 'test_helper'

class CodeSnippetsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:code_snippets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_code_snippet
    assert_difference('CodeSnippet.count') do
      post :create, :code_snippet => { }
    end

    assert_redirected_to code_snippet_path(assigns(:code_snippet))
  end

  def test_should_show_code_snippet
    get :show, :id => code_snippets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => code_snippets(:one).id
    assert_response :success
  end

  def test_should_update_code_snippet
    put :update, :id => code_snippets(:one).id, :code_snippet => { }
    assert_redirected_to code_snippet_path(assigns(:code_snippet))
  end

  def test_should_destroy_code_snippet
    assert_difference('CodeSnippet.count', -1) do
      delete :destroy, :id => code_snippets(:one).id
    end

    assert_redirected_to code_snippets_path
  end
end
