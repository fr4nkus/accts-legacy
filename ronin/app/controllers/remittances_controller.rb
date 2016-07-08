class RemittancesController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @remittances = Remittance.paginate( :page => params[ :page ] )
  end

  def show
    @remittance = Remittance.find(params[:id])
  end

  def new
    @remittance = Remittance.new
  end

  def create
    @remittance = Remittance.new(params[:remittance])
    if @remittance.save
      flash[:notice] = 'Remittance was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @remittance = Remittance.find(params[:id])
  end

  def update
    @remittance = Remittance.find(params[:id])
    if @remittance.update_attributes(params[:remittance])
      flash[:notice] = 'Remittance was successfully updated.'
      redirect_to :action => 'show', :id => @remittance
    else
      render :action => 'edit'
    end
  end

  def destroy
    Remittance.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
