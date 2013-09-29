class Post < ActiveRecord::Base
  attr_accessible :text, :title
  has_many :comments, dependent: :destroy
  has_many :labels
  validates :title, presence: true,
                    length: { minimum: 5 }
end
