class Artwork < ApplicationRecord
  validates :artist_id, uniqueness: true, presence: true
  validates :title, presence: true

  belongs_to :artist,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer

  has_many :comments, 
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :Comment,
  dependent: :destroy

  has_many :liked,
  as: :likes
  
end
