class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 5 }

  # def self.search(search)
  #   if search
  #     find( :all, :conditions => ['title LIKE ?', "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end
end
