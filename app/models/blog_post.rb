class BlogPost < ApplicationRecord

  validates :title, :blog_entry, presence: true
  validates :title, uniqueness: true, length: {maximum: 140}

  has_many :comments, dependent: :destroy
  belongs_to :user

  paginates_per 3

end
