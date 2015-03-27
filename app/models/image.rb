class Image < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :album

  validates :url, presence: true

  # we get url from uploading the image after the instance of the model is created

end
