require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    
    doc.css(".student-card").each do |student|
      
      index_page = {
        :name => student.css("h4").text,
        :location => student.css("p").text,
        :profile_url => student.css("a").attribute("href").value
      }
      
      students << index_page
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    student = {}
    
    links = doc.css(".social-icon-container a").collect{|link|
    link.attribute("href").value}
    
    links.each do |link|
      if link.include?("twitter")
        student[:twitter] = link 
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
         student[:github] = link 
      else
        student[:blog] = link
      end
    end

      student[:profile_quote] = doc.css(".profile-quote").text
      student[:bio] = doc.css("p").text
      
      student
    end

end

