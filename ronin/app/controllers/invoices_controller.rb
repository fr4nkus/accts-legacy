class InvoicesController < ApplicationController

  layout "generic"

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @invoices = Invoice.paginate( :page => params[ :page ], :order => 'reference DESC' )
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create

    @invoice = Invoice.new(params[:invoice])
    @invoice.paid = 20090815;

    if @invoice.save
      flash[:notice] = 'Invoice was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update_attributes(params[:invoice])
      flash[:notice] = 'Invoice was successfully updated.'
      redirect_to :action => 'show', :id => @invoice
    else
      render :action => 'edit'
    end
  end

  def destroy
    Invoice.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
