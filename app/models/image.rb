class Image < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :owner, class_name: 'User'
  belongs_to :album

  def owner?(user)
    if self.owner == user
      true
    else
      false
    end
  end

  def contributor
    self.owner ? self.owner.username : "Guest"
  end

  # validates :file_url, presence: true
  # after_create :notify_album

  # we get url from uploading the image after the instance of the model is created

  # def notify_album
  #   Album.connection.execute "NOTIFY albums, 'data'"
  # end

end
