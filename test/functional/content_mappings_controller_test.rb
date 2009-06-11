require 'test_helper'

class ContentMappingsControllerTest < ActionController::TestCase
  
  should "create a new asset on the home page in the first section" do
    assert_difference(Page.find(1).assets.size.to_s) do
      post :create, :content_mapping => {:page_id => 1, :section_id => 1, :asset_type => 'TextBlock', :asset_id => 1}
    end
  end
  
  
  
  
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_mapping" do
    assert_difference('ContentMapping.count') do
      post :create, :content_mapping => { }
    end

    assert_redirected_to content_mapping_path(assigns(:content_mapping))
  end

  test "should show content_mapping" do
    get :show, :id => content_mappings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => content_mappings(:one).id
    assert_response :success
  end

  test "should update content_mapping" do
    put :update, :id => content_mappings(:one).id, :content_mapping => { }
    assert_redirected_to content_mapping_path(assigns(:content_mapping))
  end

  test "should destroy content_mapping" do
    assert_difference('ContentMapping.count', -1) do
      delete :destroy, :id => content_mappings(:one).id
    end

    assert_redirected_to content_mappings_path
  end
end
