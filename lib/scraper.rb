require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    # doc.css(".student-card a").first["href"]
    # doc.css(".student-card a .student-location").first
    # doc.css(".student-card a .student-name").first

    student_hashes = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css(".student-card a").collect do |student|
       student_hashes << { name: student.css(".student-name").text.strip, 
       location: student.css(".student-location").text.strip, 
       profile_url: student["href"]
      }   
    end
    student_hashes
  end

  def self.scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))
    person_hash = {}
    profile_page.css(".social-icon-container a").each do |page|
      person_hash[:twitter] = page["href"] if page["href"].include?("twitter")
      person_hash[:linkedin] = page["href"] if page["href"].include?("linkedin")
      person_hash[:github] = page["href"] if page["href"].include?("github")
      person_hash[:youtube] = page["href"] if page["href"].include?("youtube")
      person_hash[:facebook] = page["href"] if page["href"].include?("facebook")
      person_hash[:blog] = page["href"] unless (page["href"].include?("twitter") or page["href"].include?("linkedin") or page["href"].include?("github") or page["href"].include?("youtube"))
    end
    person_hash[:profile_quote] = profile_page.css(".profile-quote").text.strip
    person_hash[:bio] = profile_page.css(".description-holder p").text.strip
    # binding.pry    
    person_hash
  end

end

