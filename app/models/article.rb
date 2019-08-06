class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_one_attached :image
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 5 }
  paginates_per 5

  # def self.search(search)
  #   if search
  #     where("title ILIKE ? ", "%#{:search}%")
  #   else
  #     all
  #   end
  # end
end
