class ExpenseItemsController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @expense_items = ExpenseItem.paginate( :page => params[ :page ], :order => 'expense_date' )
  end

  def show
    @expense_items = ExpenseItem.find(params[:id])
  end

  def new
    @expense_items = ExpenseItem.new
  end

  def create
    @expense_items = ExpenseItem.new(params[:expense_items])
    if @expense_items.save
      flash[:notice] = 'ExpenseItems was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @expense_item = ExpenseItem.find(params[:id])
  end

  def update
    @expense_item = ExpenseItem.find(params[:id])
    if @expense_item.update_attributes(params[:expense_item])
      flash[:notice] = 'ExpenseItem was successfully updated.'
      redirect_to :controller => 'expenses', :action => 'show', :id => @expense_item.expense.id
    else
      render :action => 'edit'
    end
  end

  def destroy
    ExpenseItem.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
