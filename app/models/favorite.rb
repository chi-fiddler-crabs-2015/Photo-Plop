class Favorite < ActiveRecord::Base
  belongs_to :album
  belongs_to :user

  def change_status
    self.favorite = !self.favorite
  end
end
