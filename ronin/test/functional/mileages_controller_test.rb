require File.dirname(__FILE__) + '/../test_helper'
require 'mileages_controller'

# Re-raise errors caught by the controller.
class MileagesController; def rescue_action(e) raise e end; end

class MileagesControllerTest < Test::Unit::TestCase
  fixtures :mileages

  def setup
    @controller = MileagesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = mileages(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:mileages)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:mileage)
    assert assigns(:mileage).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:mileage)
  end

  def test_create
    num_mileages = Mileage.count

    post :create, :mileage => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_mileages + 1, Mileage.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:mileage)
    assert assigns(:mileage).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Mileage.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Mileage.find(@first_id)
    }
  end
end
