class MonitorWorker
    include Sidekiq::Worker
    require 'nokogiri'
    require 'open-uri'
    # depois de testar como task no rake coloque seu codigo aqui
    def perform()
        websites = Website.all
        websites.each do |website|
            puts website.search_place
            doc = Nokogiri::HTML(open(website.url))
            doc.css(website.search_place).each do |link|
                link.content = link.content.tr('^A-Za-z0-9', '')
                website.content = website.content.tr('^A-Za-z0-9', '')
                print "Content banco: #{link.content} | Content Find: #{website.content} \n"
                if website.content == link.content
                    print "Working \n"
                else
                    print "Not Working\n"
                end
            end
        end
    end
end