class DaybooksController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @daybooks = Daybooks.paginate( :page => params[ :page ] )
  end

  def show
    @daybooks = Daybooks.find(params[:id])
  end

  def new
    @daybooks = Daybooks.new
  end

  def create
    @daybooks = Daybooks.new(params[:daybooks])
    if @daybooks.save
      flash[:notice] = 'Daybooks was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @daybooks = Daybooks.find(params[:id])
  end

  def update
    @daybooks = Daybooks.find(params[:id])
    if @daybooks.update_attributes(params[:daybooks])
      flash[:notice] = 'Daybooks was successfully updated.'
      redirect_to :action => 'show', :id => @daybooks
    else
      render :action => 'edit'
    end
  end

  def destroy
    Daybooks.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
