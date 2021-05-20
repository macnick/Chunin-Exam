require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is invalid if the link is less than 25 chars long" do
    link = Link.new(url: 'abc');
    expect(link.valid?).to be(false)
  end

  it "is invalid it the link does not contain http://" do
    link = Link.new(url: "www.apple.com/a_url_without_http")
    expect(link.valid?).to be(false)
  end
  
end

