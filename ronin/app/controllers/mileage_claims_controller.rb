class MileageClaimsController < ApplicationController
  
   layout "generic"
   
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def create_mileage_entry
    @mileage = Mileage.new(params[:mileage])
    if @mileage.save
      flash[:notice] = 'Mileage was successfully created.'
      redirect_to :action => 'show', :id => @mileage.mileageClaim
    else
      render :action => 'show', :id => @mileage.mileageClaim
    end
  end
  
  def list
    @claims = MileageClaim.paginate( :page => params[ :page ], :order => "period_end DESC" )
  end

  def show
    @claim = MileageClaim.find(params[:id])
    @mileages = @claim.mileages
  end

  def new
    @claim = MileageClaim.new
  end

  def create
    @claim = MileageClaim.new(params[:claim])
    @claim.prepopulate_mileages

    if @claim.save
      flash[:notice] = 'Mileage Claim was successfully created.'
      redirect_to :action => 'show', :id => @claim.id
    else
      render :action => 'new'
    end
    
  end

  def edit
    @claim = MileageClaim.find(params[:id])
  end

  def update
    @claim = MileageClaim.find(params[:id])
    
    if @claim.update_attributes(params[:claim])
      flash[:notice] = 'Mileage Claim was successfully updated.'
      redirect_to :action => 'show', :id => @claim
    else
      render :action => 'edit'
    end
  end

  def destroy_mileage
    mileage = Mileage.find(params[:id])
    mileage.destroy
  end

  def destroy
    claim = MileageClaim.find(params[:id])
    claim.mileages.destroy
    claim.destroy
    redirect_to :action => 'list'
  end

end
