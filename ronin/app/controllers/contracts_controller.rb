class ContractsController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @contracts = Contract.paginate( :page => params[ :page ] )
  end

  def new
    @action = 'create'
    @contract = Contract.new
    render :partial => "form", locals => { :action => @action, :contract => @contract }
  end

  def create
    @contract = Contract.new(params[:contract])
    if @contract.save
      flash[:notice] = 'Contract was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @action = 'update'
    @contract = Contract.find(params[:id])
    render :partial => "form", :locals => { :action => @action, :contract => @contract }
  end

  def update
    @contract = Contract.find(params[:id])
    if @contract.update_attributes(params[:contract])
      flash[:notice] = 'Contract was successfully updated.'
      redirect_to :action => 'show', :id => @contract
    else
      render :action => 'edit'
    end
  end

  def destroy
    Contract.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
