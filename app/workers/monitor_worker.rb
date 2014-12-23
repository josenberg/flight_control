class MonitorWorker
    include Sidekiq::Worker
    # depois de testar como task no rake coloque seu codigo aqui
    def perform()
        websites = Website.all
        print "\n"
        websites.each do |website|
            print "#{website.url}\n"
        end
        print "\n\n"
    end
end