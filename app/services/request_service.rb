class RequestService
  ROOT_URL = 'https://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=&app_key='

  def perform!
    disruptions = parse_data(get_data)
   fetch_disruptions(disruptions)
  end

  def get_data
    RestClient.get ROOT_URL
  end

  def parse_data(response)
    result = Nokogiri::XML(response.body).remove_namespaces!
    puts result
    result
  end

  def fetch_disruptions(disruptions)
    disruptions.xpath('//Disruptions/Disruption')
  end


end