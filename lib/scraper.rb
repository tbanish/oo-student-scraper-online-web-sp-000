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
    student = {}
    #binding.pry
    container = doc.css(".social-icon-container a").collect {|icon| icon.attribute("href").value}
    
    container.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      elsif link.include?(".com")
        student[:blog] = link
      end
    end
    
    student[:profile_quote] = doc.css(".profile-quote").first.text
    student[:bio] = doc.css(".description-holder p").first.text
    student
    
    
  

  end

end




