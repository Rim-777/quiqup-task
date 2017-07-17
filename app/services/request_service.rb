class RequestService
  ROOT_URL = 'https://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=&app_key='

  def perform!
    disruptions = parse_data(get_data)
    optimize_data(fetch_disruptions(disruptions))
  end

  def get_data
    RestClient.get ROOT_URL
  end

  def parse_data(response)
    Nokogiri::XML(response.body).remove_namespaces!
  end

  def fetch_disruptions(disruptions)
    disruptions.xpath('//Disruptions/Disruption')
  end

  def optimize_data(disruptions)
    disruptions.map do |disruption|
      id = disruption.attribute('id')
      coordinates = disruption.xpath('.//Point/coordinatesLL').text
      location = disruption.xpath('.//location').text
      coordinates = coordinates.split(',').map {|coord| coord.to_f}

      {
          id: id,
          location: location,
          coords: {lng: coordinates.first, lat: coordinates.last},
      }
    end
  end
end
