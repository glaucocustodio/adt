class HomeController < ApplicationController
  def index
    MakeService.new.result
    @makes = Make.all.order('name ASC')
  end
end
