require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
     html = open(index_url)
     doc = Nokogiri::HTML(html)
     student_prop={}
     student_all_profiles = doc.css(".student-card a")
    
    student_all_profiles.collect do |element|
      
       student_prop={:name => element.css(".student-name").text, 
                     :location =>element.css(".student-location").text,
                     :profile_url =>element.attr('href')}
    end
    
  end

  def self.scrape_profile_page(profile_url)
      html = open(profile_url)
      doc = Nokogiri::HTML(html)
      profile_hash = {}

      social = doc.css(".vitals-container .social-icon-container a")
      social.each do |element| 
        
        if element.attr('href').include?("twitter")
          profile_hash[:twitter] = element.attr('href')
        elsif element.attr('href').include?("linkedin")
          profile_hash[:linkedin] = element.attr('href')
        elsif element.attr('href').include?("github")
          profile_hash[:github] = element.attr('href')
        elsif element.attr('href').end_with?("com/")
          profile_hash[:blog] = element.attr('href')
        end
        
      end
      profile_hash[:profile_quote] = doc.css(".vitals-container .vitals-text-container .profile-quote").text
      profile_hash[:bio] = doc.css(".bio-block.details-block .bio-content.content-holder .description-holder p").text

       return profile_hash
  end

end

