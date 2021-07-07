require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    page = open(index_url)
    scrape = Nokogiri::HTML(page)
    scrape.css('.student-card').each do |student|
      students << {:location => student.css('.student-location').text,
                    :name => student.css('h4.student-name').text,
                    :profile_url => student.css('a').attribute('href').value
                  }
    end
    students

  end

  def self.scrape_profile_page(profile_url)
    profile = {}
    profile_page = open(profile_url)
    profile_scrape = Nokogiri::HTML(profile_page)
    links = []
    profile_scrape.css('.social-icon-container a').each do |a|
      links << a
    end
    profile = {
      :profile_quote => profile_scrape.css('.vitals-text-container .profile-quote').text,
      :bio => profile_scrape.css('.bio-content.content-holder .description-holder p').text.chomp
    }
    links.each do |link|
      this_link = link.attributes['href'].value
      link_for = link.children[0].attributes['src'].value.delete_prefix("../assets/img/").delete_suffix("-icon.png")
      if link_for == "rss"
        profile[:blog] = this_link
      else
        profile[link_for.to_sym] = this_link
      end
    end

    profile
  end


end
