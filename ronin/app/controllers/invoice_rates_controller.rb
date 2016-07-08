class InvoiceRatesController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @invoice_rates = InvoiceRate.paginate( :page => params[ :page ] )
  end

  def show
    @invoice_rate = InvoiceRate.find(params[:id])
  end

  def new
    @invoice_rate = InvoiceRate.new
  end

  def create
    @invoice_rate = InvoiceRate.new(params[:invoice_rate])
    if @invoice_rate.save
      flash[:notice] = 'InvoiceRate was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @invoice_rate = InvoiceRate.find(params[:id])
  end

  def update
    @invoice_rate = InvoiceRate.find(params[:id])
    if @invoice_rate.update_attributes(params[:invoice_rate])
      flash[:notice] = 'InvoiceRate was successfully updated.'
      redirect_to :action => 'show', :id => @invoice_rate
    else
      render :action => 'edit'
    end
  end

  def destroy
    InvoiceRate.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
