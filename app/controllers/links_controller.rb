class LinksController < ApplicationController

  def show
    @link = Link.find(params[:id])
  end

  def new
  end

  def create
    @link = Link.new(params.require(:link).permit(:url))
    @link.clicked = 0
    if (!@link.save && @link.errors.messages[:url].include?("is invalid"))
      flash[:error] = "Pasted url is invalid! Please try again"
      redirect_to root_path
      return
    end
    while !@link.save do 
      @link.shortened = shorten
      @link.save
    end
    flash[:notice] = "You url has been shortened!"
    redirect_to @link
  end

  def redirect
    @link = Link.find_by(shortened: params[:shortened])
    render 'errors/404', status: 404 if @link.nil?
    @link.update_attribute(:clicked, @link.clicked + 1)
    redirect_to @link.url
  end

  private

    def shorten
      host = 'http://localhost:3000/'
      charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
      Array.new(6) { charset.sample }.join
    end
    
end
