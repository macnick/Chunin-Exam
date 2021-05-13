class LinksController < ApplicationController
  
  def show
    @link = Link.find(params[:id])
  end

  def new
  end

  def create
    @link = Link.new(params.require(:link).permit(:url))
    @link.shortened = shorten
    @link.clicked = 0
    @link.save
    # render plain: @link.inspect
    redirect_to @link
  end

  def redirect
    @link = Link.find_by(shortened: params[:shortened])#_shortened(params[:shortened]) 
    # render plain: @link.inspect
    render 'errors/404', status: 404 if @link.nil?
    @link.update_attribute(:clicked, @link.clicked + 1)
    redirect_to @link.url
  end

  private

    def shorten
      host = 'http://localhost:3000//s/'
      charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
      Array.new(7) { charset.sample }.join
    end
    
end
