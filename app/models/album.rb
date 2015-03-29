class Album < ActiveRecord::Base
  before_validation :assign_vanity_url

  belongs_to :creator, class_name: 'User', autosave: false
  has_many :images, :dependent => :destroy
  has_many :collaborators_albums, :dependent => :destroy
  has_many :collaborators, through: :collaborators_albums
  has_many :favorites, :dependent => :destroy

  validates :title, :creator, :permissions, presence: true
  validates :vanity_url, uniqueness: true

  validates_length_of :title, :maximum => 75

  validates_length_of :password, :maximum => 20


  def assign_vanity_url
    self.vanity_url ||= (FFaker::Color.name + FFaker::Food.fruit + FFaker::Color.name + rand(10..99).to_s).strip.downcase
  end

  def owner?(user)
    if self.creator.id == user.id
      true
    else
      false
    end
  end

  def authenticate(user, password='')
    album_user = AlbumsUser.find_or_create_by(user: user, album: self)
    puts "user - #{user.inspect}  *****  album - #{self.inspect}"
    puts album_user
    if album_user.access
      return true
    elsif ( self.password == nil || self.password == password )
      album_user.update_attributes(access: true)
      return true
    else
      return false
    end
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
