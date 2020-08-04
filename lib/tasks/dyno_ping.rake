desc "pings operationfaceshieldchicago.com to keep a dyno alive"
task :dyno_ping do
  require "net/http"
  #puts ENV["PING_URL"]

  if ENV["PING_URL"]
  	Net::HTTP.get(ENV["PING_URL"],"/")
  end

end