class LinksController < ApplicationController
  def show
    @link = Link.find(params[:id])
  end

  def new
  end

  def create
    @link = Link.new(params.require(:link).permit(:url))
    @link.shortened = shorten
    @link.save
    redirect_to @link
  end

  private

    def shorten
      host = 'https://localhost:3000//s/'
      charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
      host + Array.new(7) { charset.sample }.join
    end
    
end
