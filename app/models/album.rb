class Album < ActiveRecord::Base
  before_validation :assign_vanity_url

  belongs_to :creator, class_name: 'User', autosave: false
  has_many :images, :dependent => :destroy
  has_many :collaborators_albums, :dependent => :destroy
  has_many :collaborators, through: :collaborators_albums

  validates :title, :creator, :permissions, presence: true
  validates :vanity_url, uniqueness: true

  validates_length_of :title, :maximum => 75

  validates_length_of :password, :maximum => 20


  def assign_vanity_url
    self.vanity_url ||= (FFaker::Color.name + FFaker::Food.fruit + FFaker::Color.name + rand(10..99).to_s).strip.downcase
  end

  # def self.on_change
  #   Album.connection.execute "LISTEN albums"
  #   loop do
  #     Album.connection.raw_connection.wait_for_notify do |event, pid, album|
  #       yield album
  #     end
  #   end
  # ensure
  #   Album.connection.execute "UNLISTEN albums"
  # end

end
