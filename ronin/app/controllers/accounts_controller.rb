class AccountsController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @accounts = Accounts.paginate( :page => params[ :page] params[ :page] )
  end

  def show
    @accounts = Accounts.find(params[:id])
  end

  def new
    @accounts = Accounts.new
  end

  def create
    @accounts = Accounts.new(params[:accounts])
    if @accounts.save
      flash[:notice] = 'Accounts was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @accounts = Accounts.find(params[:id])
  end

  def update
    @accounts = Accounts.find(params[:id])
    if @accounts.update_attributes(params[:accounts])
      flash[:notice] = 'Accounts was successfully updated.'
      redirect_to :action => 'show', :id => @accounts
    else
      render :action => 'edit'
    end
  end

  def destroy
    Accounts.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
