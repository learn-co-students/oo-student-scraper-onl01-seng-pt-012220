require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    students = []
    
    page.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value
      student_info = {
        :name => name,
        :location => location,
        :profile_url => profile_url}
        students << student_info
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
    students_media = {}
    sm = students_media
    
    media_accounts = page.css(".social-icon-container a").collect do |student| 
      student.attribute("href").value
      
      url = student.attribute("href").value
    
      sm[:twitter] = url if url.include?("twitter.com")
      sm[:linkedin] = url if url.include?("linkedin.com")
      sm[:github] = url if url.include?("github.com")
      sm[:blog] = url if student.css("img").attribute("src").text.include?("rss-icon")
    end
      sm[:profile_quote] = page.css("div.profile-quote").text
      sm[:bio] = page.css("p").text
      
      sm 
  end

end

