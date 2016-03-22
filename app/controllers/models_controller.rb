class ModelsController < ApplicationController
  def index
    @models = ModelsService.new(make_params).result
  end

  def make_params
    params.require(:make).permit(:webmotors_make_id)
  end
end
