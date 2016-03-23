class HomeController < ApplicationController
  def index
    MakeService.new.result
    @makes = Make.where.not(webmotors_id: nil).order('name ASC')
  end
end
