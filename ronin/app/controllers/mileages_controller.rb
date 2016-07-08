class MileagesController < ApplicationController
  
   layout "generic"
  
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :update ]

  def edit
    @mileage = Mileage.find(params[:id])
  end

  def update
    @mileage = Mileage.find(params[:id])
    if @mileage.update_attributes(params[:mileage])
      flash[:notice] = 'Mileage was successfully updated.'
      redirect_to :action => 'show', :id => @mileage
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    mileage = Mileage.find(params[:id])

    id = mileage.mileage_claim_id

    if mileage.destroy
      flash[:notice] = 'Mileage was successfully removed.'
    end

    redirect_to :controller => 'mileage_claims' , :action => 'show', :id => id
  end

end
