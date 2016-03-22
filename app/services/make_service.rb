class MakeService
  def result
    Rails.cache.fetch("POST-#{Webmotors::MAKE_URI}", expires_in: 1.day) do
      insert_make_data
    end
  end

  private
    def insert_make_data
      Webmotors.post_make.each do |make|
        Make.find_or_create_by(webmotors_id: make['Id']) do |new_make|
          new_make.name = make['Nome']
        end
      end
    end
end