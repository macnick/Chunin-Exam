require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is invalid if the link is less than 25 chars long" do
    link = Link.new(url: 'abc', shortened: '123456');
    expect(link.valid?).to be(false)
  end

  it "is invalid it the link does not contain http://" do
    link = Link.new(url: "www.apple.com/a_url_without_http", shortened: '123456')
    expect(link.valid?).to be(false)
  end
  
  it "is valid if it is longer than 25 chars and starts with http:// | https://" do
    link = Link.new(url: "https://www.apple.com/a_url_with_https", shortened: '123456')
    expect(link.valid?).to be(true)
  end

  it "is invalid if shortened has been used again" do
    link1 = Link.new(url: "https://www.apple.com/a_url_with_https", shortened: '123456')
    link2 = Link.new(url: "http://www.another.com/a_url_with_http", shortened: '123456')
    link1.save
    link2.save
    expect(link2.valid?).to be(false)
  end
end

