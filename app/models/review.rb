class Review < ApplicationRecord
  belongs_to :campaign

  validates :length, presence: true, :numericality => { :greater_than => 19, :less_than => 501 }

  # DATA TO BUILD REVIEWS
  PERSONAL_PRONOUNS = ["I", "we", "you", "he", "she", "it", "they"]
  POSSESSIVE_PRONOUNS = ["my", "our", "your", "his", "hers", "its", "theirs"]
  TIME = ["a few days ago", "yesterday", "last week", "last month"]
  ADJECTIVE_PRAISE = ["great", "wonderful", "fantastic", "phenomenal", "amazing", "awesome"]
  ADJECTIVE_FEELING = ["happy", "lucky"]
  ADVERB_DEGREE = ["so", "very", "extremely"]
  PERSONS = ["mom", "stepmom", "roommate", "boss"]
  HOUSEHOLD_PERSONS = ["mom", "wife", "partner", "husband", "fiance", "fiancee"]
  SIZE = ["small", "pretty small", "large"]
  PUNCTUATION = [".", "!"]

  # Moving and cleaning services specific
  PLACE_SIZE = ["1br", "1 bedroom", "one bedroom", "2br", "2 bedroom", "two bedroom", "3br", "3 bedroom", "three bedroom", "4br", "4 bedroom", "four bedroom"]
  PLACE_TYPE = ["apartment", "condo", "house", "duplex", "single home"]
  COMPANY_SYNONYMS = ["this company", "these guys", "COMPANY_NAME", "these movers"]

  # Moving specific
  INTRO_SENTENCES = ["(reviewer) just moved from (article) (old_place) to (article) (new_place) with the help of (company).", "had (article) (adjective_praise) experience with (company)(!.)", "(company) moved me and my (household_person) to (article) (new_place) (time).", "(my/our) experience with (company) was (adjective_praise).", "(adverb_degree) (adjective_feeling) to find (company)(!.)"]



  def generate_service_review(length)
    final_review = ""
    intro = INTRO_SENTENCES.sample
    intro = build_sentence(intro)
    final_review << intro
    return final_review
  end

  def build_sentence(sentence)

    if sentence.include? '(reviewer)'
      # Generate random number for extra randomity of the result
      random = rand(0..2)
      case random
      when 0
        # Only chosing between those who are more likely to move on their own (boss, mother, stepmom, roommate)
        reviewer = "my " + PERSONS.sample
      when 1
        # I or We
        reviewer = PERSONAL_PRONOUNS[rand(0..1)]
      when 2
        # Only chosing between those who are more likely to move with the reviewer
        reviewer = "my " + HOUSEHOLD_PERSONS.sample + " and " + PERSONAL_PRONOUNS[0]
      end
      sentence = sentence.sub('(reviewer)', reviewer)
    end

    if sentence.include? '(old_place)'
      # Generate random number for extra randomity of the result
      random = rand(0..2)
      case random
      when 0
        place = PLACE_SIZE.sample + " " + PLACE_TYPE.sample
      when 1
        place = PLACE_TYPE.sample
      when 2
        place = SIZE.sample + " " + PLACE_TYPE.sample
      end
      sentence = sentence.sub('(old_place)', place)
    end

    if sentence.include? '(new_place)'
      # Generate random number for extra randomity of the result
      random = rand(0..2)
      case random
      when 0
        place = PLACE_SIZE.sample + " " + PLACE_TYPE.sample
      when 1
        place = PLACE_TYPE.sample
      when 2
        place = SIZE.sample + " " + PLACE_TYPE.sample
      end
      sentence = sentence.sub('(new_place)', place)
    end

    if sentence.include? '(company)'
      company = COMPANY_SYNONYMS.sample
      if company == "COMPANY_NAME"
        company = campaign.name
      end
      sentence = sentence.sub('(company)', company)
    end

    if sentence.include? '(adjective_praise)'
      adj = ADJECTIVE_PRAISE.sample
      sentence = sentence.sub('(adjective_praise)', adj)
    end

    if sentence.include? '(adjective_feeling)'
      adj = ADJECTIVE_FEELING.sample
      sentence = sentence.sub('(adjective_feeling)', adj)
    end

    if sentence.include? '(adverb_degree)'
      adv = ADVERB_DEGREE.sample
      sentence = sentence.sub('(adverb_degree)', adv)
    end

    if sentence.include? '(household_person)'
      person = HOUSEHOLD_PERSONS.sample
      sentence = sentence.sub('(household_person)', person)
    end

    if sentence.include? '(time)'
      time = TIME.sample
      sentence = sentence.sub('(time)', time)
    end

    if sentence.include? '(!.)'
      punctuation = PUNCTUATION.sample
      sentence = sentence.sub('(!.)', punctuation)
    end

    if sentence.include? '(my/our)'
      my_our = POSSESSIVE_PRONOUNS[rand(0..1)]
      sentence = sentence.sub('(my/our)', my_our)
    end

    # Find articles and position of the next words after them and choose
    # the correct article to use
    word_array = sentence.split(" ")
    word_array.each_with_index do |word, index|
      if word == "(article)"
        next_word = word_array[index+1]
        letter_array = next_word.split("")
        if is_vowel(letter_array[0]) && next_word != "one"
          word_array[index] = 'an'
        else
          word_array[index] = 'a'
        end
      end
    end
    sentence = word_array.join(" ")

    return sentence.capitalize!

  end

  def is_vowel(letter)
    ["a", "e", "i", "o", "u"].include?(letter)
  end

  def generate_product_review(length)

  end

end
