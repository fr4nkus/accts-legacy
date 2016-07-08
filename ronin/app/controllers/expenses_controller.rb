class ExpensesController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update, :create_expense_item ],
         :redirect_to => { :action => :list }

  def list
    @expenses = Expense.paginate( :page => params[ :page ], :order => "period_end DESC" )
  end

  def show
    @expense = Expense.find(params[:id])
    @summary = {}
  end

  def report 
    @expenses = Expense.paginate( :page => params[ :page ], :order => "period_end DESC" )
  end 
 
  def print_show
    show
    render :action => 'show', :layout => 'print'
  end
  
  def create_expense_item
    @item = ExpenseItem.new(params[:expense_item])
    if @item.save
      flash[:notice] = 'Expense was successfully created.'
      redirect_to :action => 'show', :id => @item.expense
    else
      render :action => 'show', :id => @item.expense
    end
  end
  
  def new
    now = Time.now()
    @expense = Expense.new
    @expense.period_end = now.beginning_of_month.yesterday
  end

  def create
    @expense = Expense.new(params[:expense])
    @expense.cheque_number = ""

    if @expense.save
      flash[:notice] = 'Expense was successfully created.'
      redirect_to :action => 'show', :id => @expense
    else
      render :action => 'new'
    end

  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update_attributes(params[:expense])
      flash[:notice] = 'Expense was successfully updated.'
      redirect_to :action => 'show', :id => @expense
    else
      render :action => 'edit'
    end

  end

  def destroy
    Expense.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
