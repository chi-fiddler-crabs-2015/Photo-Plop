class User < ActiveRecord::Base
  has_many :albums, foreign_key: :creator_id
  has_many :collaborators_albums, foreign_key: :collaborator_id
  has_many :images, foreign_key: :owner_id
  has_many :favorites, :dependent => :destroy

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

  def self.find_or_create_from_auth_hash(auth_hash)
    if existing_user = where("lower(username) = ?", auth_hash[:info][:nickname].downcase).first
      existing_user.update(
        provider: auth_hash[:provider],
        uid: auth_hash[:uid],
        token: auth_hash[:credentials][:token],
        secret: auth_hash[:credentials][:secret]
      )
      return existing_user
    else
      new_user = create(
        username: auth_hash[:info][:nickname],
        email: auth_hash[:info][:email],
        password: auth_hash[:uid],
        provider: auth_hash[:provider],
        uid: auth_hash[:uid],
        token: auth_hash[:credentials][:token],
        secret: auth_hash[:credentials][:secret]
      )
      return new_user
    end
  end
end
