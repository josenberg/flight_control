require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML::Document for the page we’re interested in...
# Espaço para você 'testar' o codigo
task :teste => :environment do
    doc = Nokogiri::HTML(open('http://www.sorrydave.com.br'))
    doc.css('.blog-description').each do |link|
      puts link.content
    end
end