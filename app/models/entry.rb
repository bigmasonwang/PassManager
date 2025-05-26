class Entry < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true

  validates :url, presence: true, format: { with: URI.regexp }
end
