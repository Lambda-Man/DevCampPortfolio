class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all
  end
  
  def show
    @portfolio_items = Portfolio.find(params[:id])
  end
  
  def destroy
    #looks up item
    @portfolio_items = Portfolio.find(params[:id])
    
    
    @portfolio_items.destroy
    #destroys the record
    
    #redirects
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Item was removed.' }
    end
  end


  def new
    @portfolio_items = Portfolio.new
  end
   def create
    @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated' }
      else
        format.html { render :new }
      end
    end
   end
   
   def edit
     @portfolio_items = Portfolio.find(params[:id])
   end
   
   def update
     @portfolio_items = Portfolio.find(params[:id])
     
    respond_to do |format|
      if @portfolio_items.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Records have been successfully updated' }
      else
        format.html { render :edit }
      end
    end
   end

   

end