class Cat < ApplicationRecord
  COLOR = ['black', 'white', 'calico', 'gray', 'orange']

  validates :color, :inclusion => { :in => COLOR }
  validates :sex, :inclusion => {:in => ['M', 'F']}
  validates :birth_date, :color, :name, :sex, :description, presence: true

  has_many :requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

end