class Link < ApplicationRecord
  validates :url, presence: true, length: { minimum: 30, maximum: 250 }, format: URI::regexp(%w[http https])
  validates :shortened, presence: true, uniqueness: true
end
