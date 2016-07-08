require File.dirname(__FILE__) + '/../test_helper'
require 'bank_payments_controller'

# Re-raise errors caught by the controller.
class BankPaymentsController; def rescue_action(e) raise e end; end

class BankPaymentsControllerTest < Test::Unit::TestCase
  fixtures :bank_payments

  def setup
    @controller = BankPaymentsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = bank_payments(:first).id
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

    assert_not_nil assigns(:bank_payments)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:bank_payment)
    assert assigns(:bank_payment).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:bank_payment)
  end

  def test_create
    num_bank_payments = BankPayment.count

    post :create, :bank_payment => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_bank_payments + 1, BankPayment.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:bank_payment)
    assert assigns(:bank_payment).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      BankPayment.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      BankPayment.find(@first_id)
    }
  end
end
