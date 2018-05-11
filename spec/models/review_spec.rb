require  'rails_helper'

describe Review do
  it { should validate_presence_of :content }
  it { should ensure_length_of(:content).is_at_least(20) }
  it { should ensure_length_of(:content).is_at_most(500) }
  it { should validate_numericality_of(:length).is_greater_than(19).is_less_than(500) }
  it { should belong_to :campaign }
end
