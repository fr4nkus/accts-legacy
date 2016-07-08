class InvoiceTypesController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @invoice_types = InvoiceType.paginate( :page => params[ :page ] )
  end

  def show
    @invoice_type = InvoiceType.find(params[:id])
  end

  def new
    @invoice_type = InvoiceType.new
  end

  def create
    @invoice_type = InvoiceType.new(params[:invoice_type])
    if @invoice_type.save
      flash[:notice] = 'InvoiceType was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @invoice_type = InvoiceType.find(params[:id])
  end

  def update
    @invoice_type = InvoiceType.find(params[:id])
    if @invoice_type.update_attributes(params[:invoice_type])
      flash[:notice] = 'InvoiceType was successfully updated.'
      redirect_to :action => 'show', :id => @invoice_type
    else
      render :action => 'edit'
    end
  end

  def destroy
    InvoiceType.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
