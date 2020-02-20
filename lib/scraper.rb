require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    scraped_array = []
    scraped = doc.css(".student-card")
    scraped.map do |student|
      students = Hash.new
    students[:name] = student.css(".student-name").text
    students[:location] = student.css(".student-location").text
    students[:profile_url] = student.css("a").first["href"]
    scraped_array << students
    end
    scraped_array
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    student = Hash.new
    scraped = doc.css(".social-icon-container a").collect { |anchor| anchor.attribute("href").value }
    scraped.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      elsif link.include?("http")
        student[:blog] = link
      end
    end
    student[:profile_quote] = doc.css(".profile-quote").text
    student[:bio] = doc.css(".description-holder p").text
    student

  end

end

