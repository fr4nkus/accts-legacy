require File.dirname(__FILE__) + '/../test_helper'
require 'employees_controller'

# Re-raise errors caught by the controller.
class EmployeesController; def rescue_action(e) raise e end; end

class EmployeesControllerTest < Test::Unit::TestCase
  fixtures :employees

  def setup
    @controller = EmployeesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = employees(:first).id
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

    assert_not_nil assigns(:employees)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:employee)
    assert assigns(:employee).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:employee)
  end

  def test_create
    num_employees = Employee.count

    post :create, :employee => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_employees + 1, Employee.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:employee)
    assert assigns(:employee).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Employee.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Employee.find(@first_id)
    }
  end
end
