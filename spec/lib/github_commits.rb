class GithubCommits < ApiQueryProvider::Base
  api_for :api_url => "http://github.com/api/v2/json/",
          :api_path => "commits/list/:user_id/:repository/:branch"
  self.data_selector = Proc.new {|element| element["commits"] }
  self.autogenerate = true
  
  self.custom_field :author do |input|
    GithubUser.new input
  end
end