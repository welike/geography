$VERBOSE = nil
Dir["#{Gem.searcher.find('geography').full_gem_path}/lib/geography/tasks/*.rake"].each { |ext| load ext }