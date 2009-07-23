class Contact < ActiveRecord::Base
  belongs_to :company

  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,4})$/i

  validates_format_of :phone, :with => /^00 [0-9]{3} [0-9]{6}$/i, :message => "number should be in format 00 nnn nnnnnn"

  validates_presence_of :firstname, :lastname, :email, :phone


  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :normal  => "250x250>" },
    :default_style => :normal,
    :default_url => "silhouette_:style.png"


end
