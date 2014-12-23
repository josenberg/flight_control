# Espaço para você 'testar' o codigo
task :teste => :environment do
    websites = Website.all
    print "\n"
    websites.each do |website|
        print "#{website.url}\n"
    end
    print "\n\n"
end