class Album < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :images, :dependent => :destroy
  has_many :collaborators_albums, :dependent => :destroy
  has_many :collaborators, through: :collaborators_albums

  validates :title, :vanity_url, :creator, :permissions, presence: true
  validates :vanity_url, uniqueness: true

  validates_length_of :title, :maximum => 75

  validates_length_of :password, :minimum => 4
  validates_length_of :password, :maximum => 20

  before_create :assign_vanity_url

  def assign_vanity_url
    self.vanity_url = (FFaker::Color.name + FFaker::Food.fruit + FFaker::Color.name + rand(10..99).to_s).strip.downcase
  end

end
