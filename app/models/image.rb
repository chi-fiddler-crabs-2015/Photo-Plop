class Image < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :owner, class_name: 'User'
  belongs_to :album

  # validates :file_url, presence: true
  # after_create :notify_album

  # we get url from uploading the image after the instance of the model is created

  # def notify_album
  #   Album.connection.execute "NOTIFY albums, 'data'"
  # end

end
