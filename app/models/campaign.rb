class Campaign < ApplicationRecord
  has_many :reviews

  validates :type_name, :presence => true
  validates :specialization, :presence => true
end
