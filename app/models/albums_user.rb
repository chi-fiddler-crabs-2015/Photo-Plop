class AlbumsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :album

  validates :read_privilege, presence: true
  validates :write_privilege, presence: true

end
