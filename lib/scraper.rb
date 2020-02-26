require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    scraped = Nokogiri::HTML(open(index_url))
    student_cards = scraped.css(".student-card")

    student_cards.each {|student|
      student_data = {}
      student_data[:name] = student.css(".student-name").text
      student_data[:location] = student.css(".student-location").text
      student_data[:profile_url ] = student.css("a").attribute("href").value
      students.push(student_data)
    }
    students
  end

  def self.scrape_profile_page(profile_url)
    student = Nokogiri::HTML(open(profile_url))

    student_data = {}
    student_data[:bio] = student.css(".description-holder").css("p").text
    student_data[:profile_quote] = student.css(".profile-quote").text

    student.css(".social-icon-container").css("a").each do |social_media_data|
      link = social_media_data.attribute("href").value
      if link.include?("twitter")
        student_data[:twitter] = link
      elsif link.include?("linkedin")
        student_data[:linkedin] = link
      elsif link.include?("github")
        student_data[:github] = link
      else
        student_data[:blog] = link
      end
    end
    student_data
  end

end
