class MonitorWorker
    include Sidekiq::Worker
    # depois de testar como task no rake coloque seu codigo aqui
    def perform()
        10.times do |i|
            puts "just a test"
        end
    end
end