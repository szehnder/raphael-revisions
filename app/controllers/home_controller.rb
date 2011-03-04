class HomeController < ApplicationController
  def index
    @documents = Document.all
  end
  
  def template
  end
end
