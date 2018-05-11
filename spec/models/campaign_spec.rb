require  'rails_helper'

describe Campaign do
  it { should validate_presence_of :type_name }
  it { should validate_presence_of :specialization }
  it { should have_many :reviews }
end
