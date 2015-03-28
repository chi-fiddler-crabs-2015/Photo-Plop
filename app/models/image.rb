class Image < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :owner, class_name: 'User'
  belongs_to :album

  def deletable?(user_id)
    if user_id == ( self.owner.id || self.album.creator.id )
      true
    else
      false
    end
  end


  # validates :file_url, presence: true
  # after_create :notify_album

  # we get url from uploading the image after the instance of the model is created

  # def notify_album
  #   Album.connection.execute "NOTIFY albums, 'data'"
  # end

end
