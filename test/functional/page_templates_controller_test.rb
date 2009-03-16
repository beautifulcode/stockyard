require 'test_helper'

class PageTemplatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_template" do
    assert_difference('PageTemplate.count') do
      post :create, :page_template => { }
    end

    assert_redirected_to page_template_path(assigns(:page_template))
  end

  test "should show page_template" do
    get :show, :id => page_templates(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => page_templates(:one).id
    assert_response :success
  end

  test "should update page_template" do
    put :update, :id => page_templates(:one).id, :page_template => { }
    assert_redirected_to page_template_path(assigns(:page_template))
  end

  test "should destroy page_template" do
    assert_difference('PageTemplate.count', -1) do
      delete :destroy, :id => page_templates(:one).id
    end

    assert_redirected_to page_templates_path
  end
end
