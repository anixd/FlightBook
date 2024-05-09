class MotoModel < ApplicationRecord
  belongs_to :moto_brand
  has_many :motorcycles


end
