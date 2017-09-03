class SinatraBasicApp < Sinatra::Base
  get "/time" do
    sleep(5)
    Time.now.to_s
  end
end
