class ModelsService
  def initialize params
    @make = Make.find_by_webmotors_id(params[:webmotors_id])
  end

  def result
    Rails.cache.fetch("POST-#{Webmotors::MODELS_URI}-#{@make.webmotors_id}", expires_in: 1.day) do
      insert_model_data
    end
    @make.models.order('name ASC')
  end

  private
    def insert_model_data
      Webmotors.post_models_for(@make.webmotors_id).each do |model|
        Model.find_or_create_by(webmotors_id: model['Id'], make_id: @make.id) do |new_model|
          new_model.name = model['Nome']
        end
      end
    end
end