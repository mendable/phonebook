class ContactsController < ApplicationController

  before_filter :load_company

  # GET /contacts
  # GET /contacts.xml
  def index
    @contacts = @company.contacts.paginate(:page => params[:page], :order => :created_at)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = @company.contacts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contact = @company.contacts.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = @company.contacts.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = @company.contacts.new(params[:contact])

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to([@contact.company, @contact]) }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = @company.contacts.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to([@contact.company, @contact]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = @company.contacts.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(company_contacts_path) }
      format.xml  { head :ok }
    end
  end

  
  private
    def load_company
      @company = Company.find(params[:company_id])
    end
end
