require 'open-uri'
require 'pry'

# student name => doc.css(".student-name").first.text

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    binding.pry
  end

  def self.scrape_profile_page(profile_url)
    
  end

end




