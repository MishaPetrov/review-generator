class Review < ApplicationRecord
  belongs_to :campaign

  validates :length, presence: true, :numericality => { :greater_than => 19, :less_than => 501 }

  # DATA TO BUILD REVIEWS
  PERSONAL_PRONOUNS = ["I", "we", "you", "he", "she", "it", "you", "they"]
  POSSESSIVE_PRONOUNS = ["mine", "ours", "yours", "his", "hers", "its", "yours", "theirs"]
  TIME = ["just", "recently", "few days ago", "yestersay", "last week", "last month"]

  # Moving and cleaning services specific
  PLACE_SIZE = ["1br", "1 bedroom", "one bedroom", "2br", "2 bedroom", "two bedroom", "3br", "3 bedroom", "three bedroom", "4br", "4 bedroom", "four bedroom"]
  PLACE_TYPE = ["apartment", "condo", "house", "duplex", "single home"]

  # Moving specific
  INTRO_SENTENCES = ["(reviewer) just moved from a (old_place) to a (new_place) with the help of (company).", ]

  def generate_service_review(length)
    final_review = ""
    intro = INTRO_SENTENCES.sample
    if intro.include? '(reviewer)'
      intro.sub! '(reviewer)', PERSONAL_PRONOUNS[rand(0..1)]
    end
    if intro.include? '(old_place)'
      place = ""
      place << PLACE_SIZE.sample << " " << PLACE_TYPE.sample
      intro.sub! '(old_place)', place
    end
    if intro.include? '(new_place)'
      place = ""
      place << PLACE_SIZE.sample << " " << PLACE_TYPE.sample
      intro.sub! '(new_place)', place
    end
    if intro.include? '(company)'
      intro.sub! '(company)', campaign.name
    end
    final_review << intro
    return final_review
  end

  def generate_product_review(length)

  end

end
