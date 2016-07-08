class ExpenseTypesController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @expense_types = ExpenseType.find(:all, { :order => 'name' } )
  end

  def show
    @expense_type = ExpenseType.find(params[:id])
  end

  def new
    @expense_type = ExpenseType.new
  end

  def create
    @expense_type = ExpenseType.new(params[:expense_type])
    if @expense_type.save
      flash[:notice] = 'ExpenseType was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @expense_type = ExpenseType.find(params[:id])
  end

  def update
    @expense_type = ExpenseType.find(params[:id])
    if @expense_type.update_attributes(params[:expense_type])
      flash[:notice] = 'ExpenseType was successfully updated.'
      redirect_to :action => 'show', :id => @expense_type
    else
      render :action => 'edit'
    end
  end

  def destroy
    ExpenseType.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
