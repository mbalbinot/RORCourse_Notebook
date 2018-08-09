class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Select contacts to show
  def get_contacts
    @contacts_selection = Contact.all
  end

  #Select kinds to show
  def get_kinds
    @kinds_selection = Kind.all
  end
end
