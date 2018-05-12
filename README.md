# REVIEW GENERATOR

### Name of Student: Misha Petrov

### Name of Project: Review Generator

### Project’s Purpose or Goal:

App (multi-user platform) to allow users generate random positive reviews for their products or services for posting on online platforms and pass the verification algorithms on such platforms as Yelp and Amazon. It will generate feedback based on a few parameters set by the creator of the campaign.

### Specifications for MVP:

* User can register/sign-in.
* User can create a campaign and set parameters such as type of campaign (product/service), area of service, etc.
* User can set a desired length of the review and generate a review.
* User can view all of her campaigns.
* User can edit and delete existing reviews.

### Tools:

* Ruby
* Rails
* HTML/CSS
* ActiveAdmin (will be used for UI)
* Dictionary Gem (to find synonyms)
* Scraping tool (to find existing reviews on same platforms)

### If MVP is done on time:

* Add mobile version (design mobile UI)
* Add stripe to charge for service
* Let user post a review directly from the app
* Post on behalf of other users (use pre-generated accounts)

**************************************************************

#### Algorithm idea brainstorming:

The goal is to have method generate reviews as unique as possible. To achieve that, algorithm should have a lot of randomization and different parts of content should by applied to each new review.
I'm going to be analyzing a lot of existing reviews from Yelp for different businesses and Amazon for various products.

Initial thoughts/plans:

* The algorithm should have an array of personal pronouns: [I, you, he, she, it, we, you, they]
* We should also define an array of possessive pronouns: [Mine, yours, his, hers, its, ours, yours, theirs] in the order according to our personal pronouns array, so we can reference the needed pronoun using the index of the array.
* We also need to define an array of other people, on behalf of whom the reviewer can speak, for instance: [friend, coworker, grandmother, mother, father, stepmom, brother, sister]
* Then, we need to have an array with different starting phrases: [(reviewer)] where (reviewer) will be changed to a random personal pronoun (or a choice of a few personal pronouns defined by the algorithm) or a possessive pronoun from the list with another person after it. So that we can generate unique introduction sentences.
* We'll do the same thing with following sentences
* We also need to remember to account for length of the review set by the user. Depending on this parameter, we'll be switching structure of the review and add different types of outputted sentences.
* We'll start by developing the algorithm for moving company reviews and then adjust it to work with other specializations.
* We should initially split algorithm into 2 separate methods generate_service_review and generate_product_review since the algorithms for these 2 will be different.
