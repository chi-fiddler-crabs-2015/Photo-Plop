class User < ActiveRecord::Base
  has_many :albums, foreign_key: :creator_id
  has_many :collaborators_albums, foreign_key: :collaborator_id
  has_many :images

  validates :email, :encrypted_password, presence: true
  validates :email, uniqueness: true
end
