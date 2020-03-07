require environment nokogiri
require environment open-url 
require environment bundler
require environment pry
require 'open-uri'
require 'pry'

class Scraper
  attr_accessor:name, :location, :index_url
    @@all = []
    
  end
end


  def self.scrape_index_page(index_url)
    scrape_index_page = scrape_index_page
    @@all << self 
    
  end

  def self.scrape_profile_page(profile_url)
      self.scrape_profile_page = self.scrape_profile_page
      @@all << self
  end
  
  end

end


array_of_links.map do |link|
 
 {:name =>"Arron Enser", :location => "Scotsdale, AZ",:profile_url =>"students/aaron-enser.html"}
 {:name =>"Jenny Yamada", :location => "Portland, OR", :profile_url => "students/jenny-yamada.html"}
 {:name => "Ruth Mesfun", :location => "Brooklyn, NY", :profile_url => "students/ruth-mesfun.html"}
 {:name => "Liz Denhup", :location => "Chicago, Il", :profile_url => "students/liz-denhup.html"}
 
Scraper.scrape_index_page(index_url)
Scraper.scrape_profile_page(profile_url)
Self.all = self 


  end
end
