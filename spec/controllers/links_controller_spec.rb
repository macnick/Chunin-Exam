require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  render_views
  
  describe "index" do
    url = "https://www.apple.com/a_url_with_https"
    
    it "renders the new template" do
      get "new"
      expect(response).to render_template("new")
    end
    
    it "has welcome message" do
      get "new"
      expect(response.body).to match /<h1>.*shortener!/
    end

    it "creates a new shortened url and saves to db" do
      url = "https://www.apple.com/a_url_with_https"
      request.env["HTTP_ACCEPT"] = "text/javascript"
      post :create, params: { link: { url: url }}
      link = assigns(:link)
      expect(link.url).to eq(url)
      expect(link.shortened.size).to eq(6)
      expect(link.persisted?).to be(true)
    end
  end
end
