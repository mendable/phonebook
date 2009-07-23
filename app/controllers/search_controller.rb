class SearchController < ApplicationController
  
  def search
    params[:q] ||= ''
    params[:q] = "%#{params[:q]}%" # convert query string to correct SQL LIKE syntax, and avoid SQL Injection
    @results = Contact.paginate(:all, :page => params[:page], :conditions => ["firstname LIKE ? OR lastname LIKE ?", params[:q], params[:q]])
  end

end
