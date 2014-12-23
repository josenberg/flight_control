every 1.minutes do
    runner "MonitorWorker.perform_async()", :environment => :development
end