require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  should_belong_to :company

  # validate email address format
  should_allow_values_for :email, *%w{com org new edu es jp info co.uk org.uk}.collect{|ending| "foo.var_1-9@baz-quux0.example.#{ending}" }
  should_not_allow_values_for :email, *%w{foobar@example.c @example.com @fcom foo@bar..com foobar@example.infod foobar.example.com foo@ex(ample.com}

  # validate phone number validation against "00 nnn nnnnnn" format
  should_allow_values_for :phone, "00 123 123456", "00 485 999999"
  should_not_allow_values_for :phone, "asdf", "00 1230000000", "00123000000", "0123912", "1391391800880128", "00 123 1234567", "22 123 123456", "00 123 bbb4"


  context "Want to validate email" do 
    setup {assert Factory(:contact)}
    should_validate_uniqueness_of :email #put this in context, requires existing record in db
  end


  should_validate_presence_of :firstname, :lastname, :email, :phone
 
end
