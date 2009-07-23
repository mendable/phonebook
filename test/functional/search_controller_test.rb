require 'test_helper'

class SearchControllerTest < ActionController::TestCase

  context "I want to search for a contact and it" do
    setup do
      Factory(:contact, :firstname => 'baz', :lastname => 'foo', :email => "foobar1@example.com")
      Factory(:contact, :firstname => 'bar', :lastname => 'mcdonald', :email => "foobar2@example.com")
    end

    context "should find one when matching record is on firstname and it" do
      setup {post :search, :q => 'baz'}

      should_respond_with :success
      should_render_template :search
      should_assign_to :results
  
      # check it actually works...
      should "return a matching result" do
        assert_equal 1, assigns(:results).size
        assert_equal "baz", assigns(:results).first.firstname
      end
    end


    context "should find one when matching record is on lastname and it" do
      setup {post :search, :q => 'mcdonald'} 

      should_respond_with :success
      should_render_template :search
      should_assign_to :results
  
      # check it actually works...
      should "return a matching result" do
        assert_equal 1, assigns(:results).size
        assert_equal "mcdonald", assigns(:results).first.lastname
      end
    end


    context "should return no results when no results found and it" do
      setup {post :search, :q => "doesnotexistinfields"}
      
      should_respond_with :success
      should_render_template :search
      should_assign_to :results

      should "return 0 results" do
        assert_equal 0, assigns(:results).size  
      end
    end

  end

end
