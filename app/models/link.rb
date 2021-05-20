class Link < ApplicationRecord
  validates :url, presence: true, length: { minimum: 20, maximum: 250 }, format: URI::regexp(%w[http https])
  validates :shortened, presence: true, uniqueness: true
end
