require 'test_helper'

class ContactsControllerTest < ActionController::TestCase

  context "With an existing company" do
    setup do
      @company = Factory(:company)
    end

    context "I want to view the new contact page and it" do
      setup { get :new, :company_id => @company }
      should_respond_with :success
      should_render_template :new
    end

    context "I want to create new contacts and give them a first name, last name, email address, and phone number and it" do
      setup do 
        post :create, :company_id => @company, :contact => {:lastname => "lambert", :firstname => "jason", :phone => "00 123 123456", :email => "foobar@example.com"}
      end
      
      should_set_the_flash_to /successfully created/
      should_assign_to :contact
      should_redirect_to("company_contact_path(@company, @contact)") { company_contact_path(@company, assigns(:contact)) }
    end
  end


  context "With an existing company that has contacts" do
    setup do
      @contact = Factory(:contact)
      @company = @contact.company
    end
    
    context "I want to view a list of all of my contacts and it" do
      setup { get :index, :company_id => @company }

      should_respond_with :success
      should_render_template :index
      should_assign_to :contacts
    end
  end


  context "With an existing company and contact" do
    setup do
      @contact = Factory(:contact)
      @company = @contact.company
    end

    context "I want to see the edit page and it" do
      setup { get :edit, :company_id => @company, :id => @contact }
      should_respond_with :success
      should_render_template :edit
    end

    context "I want to update the contact and it" do
      setup { put :update, :company_id => @company, :id => @contact, :contact => {} } 
      should_set_the_flash_to /successfully updated/
      should_redirect_to("company_contact_path(@company, @contact)") { company_contact_path(@company, @contact) }
    end
  end
 
end
