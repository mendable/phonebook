require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  should_have_many :contacts
  should_validate_presence_of :name
end
