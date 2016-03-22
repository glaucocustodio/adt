class Webmotors
  BASE_URI = "http://www.webmotors.com.br/carro"
  MAKE_URI = "#{BASE_URI}/marcas"
  MODELS_URI = "#{BASE_URI}/modelos"


  def self.post_make
    uri = URI(MAKE_URI)
    response = Net::HTTP.post_form(uri, {})
    JSON.parse(response.body)
  end

  def self.post_models_for make_id
    uri = URI(MODELS_URI)
    response = Net::HTTP.post_form(uri, { marca: make_id })
    JSON.parse response.body
  end
end