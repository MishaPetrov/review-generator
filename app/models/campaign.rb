class Campaign < ApplicationRecord
  has_many :reviews

  validates :name, :presence => true
  validates :type_name, :presence => true
  validates :specialization, :presence => true
end
