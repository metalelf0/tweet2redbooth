ENV["REDISTOGO_URL"] ||= 'redis://redistogo:78587c36f34b42888555f15f6617c635@jack.redistogo.com:11381/'
uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :scheme => uri.scheme, :thread_safe => true)
