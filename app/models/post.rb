class Post < ActiveRecord::Base
  attr_accessible :text, :title
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
