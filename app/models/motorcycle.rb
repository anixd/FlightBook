class Motorcycle < ApplicationRecord
  belongs_to :moto_brand
  belongs_to :moto_model
  belongs_to :current_owner, class_name: 'User', foreign_key: :current_owner_id


end
