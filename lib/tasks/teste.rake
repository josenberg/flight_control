require 'nokogiri'
require 'open-uri'

task :teste => :environment do

    websites = Website.all
    websites.each do |website|
        puts website.search_place
        doc = Nokogiri::HTML(open(website.url))
        doc.css(website.search_place).each do |link|
            link.content = link.content.tr('^A-Za-z0-9', '')
            website.content = website.content.tr('^A-Za-z0-9', '')
            print "Content banco: #{link.content} | Content Find: #{website.content} \n"
            report = Report.new
            report.id_website = website.id
            if website.content == link.content
                report.status = "Working"
                print "Working \n"
            else
                report.status = "Not Working"
                print "Not Working\n"
            end
            report.save
        end
    end
end