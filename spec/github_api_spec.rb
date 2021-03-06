require 'spec_helper'
require 'lib/github_commits'
require 'lib/github_user'

describe "github commit api" do
  it "should construct a valid object" do
    lambda do 
      GithubCommits.where(:user_id => "Femaref")
                   .where(:repository => "c2dm-rails")
                   .where(:branch => "master")
                   .execute
    end.should_not raise_error
  end
end