class AboutsController < InheritedResources::Base
  def index
    @page = About.first
  end
end
