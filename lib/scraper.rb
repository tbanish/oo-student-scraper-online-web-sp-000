require 'open-uri'
require 'pry'

# name => doc.css(".student-name").text
# location => doc.css(".student-location").text
# profile_url => doc.css(".student-card").css("a").attribute("href").value

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    
    doc.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css(".student-card").css("a").attribute("href").value
      student_info = {
        :name => name,
        :location => location,
        :profile_url => profile_url,
      }
      students << student_info
    end
    students
  end
      
      
    


  def self.scrape_profile_page(profile_url)
    
  end

end




