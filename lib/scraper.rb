require 'open-uri'
require 'pry'

# name => doc.css(".student-name").first.text
# location => doc.css(".student-location").first.text
# profile_url => doc.css(".student-card").first.css("a").attribute("href").value

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    
    doc.css("div.student-card")
    
    
    
    binding.pry
  end

  def self.scrape_profile_page(profile_url)
    
  end

end




