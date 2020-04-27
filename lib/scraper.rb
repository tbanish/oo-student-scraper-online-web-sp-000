require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    
    doc.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value
      student_info = {
        :name => name,
        :location => location,
        :profile_url => profile_url,
      }
      students << student_info
    end
    students
  end
      
      
    # twitter => doc.css(".social-icon-container").css("a").attribute("href").value
    # linkedin
    # github
    # blog
    # profile_quote
    # bio


  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    container = doc.css(".social-icon-container a").collect do |icon|
      icon.attribute("href").value
    end
    
    binding.pry
  end

end




