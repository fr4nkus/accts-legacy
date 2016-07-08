class EmployeesController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @employees = Employees.paginate( :page => params[ :page ] )
  end

  def show
    @employees = Employees.find(params[:id])
  end

  def new
    @employees = Employees.new
  end

  def create
    @employees = Employees.new(params[:employees])
    if @employees.save
      flash[:notice] = 'Employees was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @employees = Employees.find(params[:id])
  end

  def update
    @employees = Employees.find(params[:id])
    if @employees.update_attributes(params[:employees])
      flash[:notice] = 'Employees was successfully updated.'
      redirect_to :action => 'show', :id => @employees
    else
      render :action => 'edit'
    end
  end

  def destroy
    Employees.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
