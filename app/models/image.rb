class Image < ActiveRecord::Base
  belongs_to :user

  def popularity
    if self.upvotes <= 5
      "col-md-2"
    elsif self.upvotes <= 10
      "col-md-3"
    elsif self.upvotes <= 15
      "col-md-4"
    elsif self.upvotes > 15
      "col-md-6"
    end
  end
end
