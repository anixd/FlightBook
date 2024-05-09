class MotoBrand < ApplicationRecord
  has_many :moto_models, dependent: :destroy
  has_many :motorcycles


end
