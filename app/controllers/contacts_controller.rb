class ContactsController < InheritedResources::Base

  def index
    @page = Contact.first
  end

end
