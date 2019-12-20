class Book < ApplicationRecord

belongs_to :user

validates :body, presence:true, length: { maximum:50 }
validates :title, presence:true




end
