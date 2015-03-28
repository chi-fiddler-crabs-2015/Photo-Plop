class User < ActiveRecord::Base
  has_many :albums, foreign_key: :creator_id
  has_many :collaborators_albums, foreign_key: :collaborator_id
  has_many :images, foreign_key: :owner_id

  validates :email, :password_hash, presence: true
  validates :email, :username, uniqueness: { case_sensitive: true }

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(plaintext)
    @password = BCrypt::Password.create(plaintext)
    self.password_hash = @password
  end

  def self.authenticate(user)
    @_user = User.find_by(username: user[:username])
    @_user if @_user && @_user.password == user[:password]
  end

end
