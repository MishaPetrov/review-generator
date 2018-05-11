class Review < ApplicationRecord
  belongs_to :campaign

  validates_length_of :length, :minimum => 20, :maximum => 500, :allow_blank => false
end
