class Review < ApplicationRecord
  belongs_to :campaign

  validates :length, presence: true, :numericality => { :greater_than => 19, :less_than => 501 }
end
