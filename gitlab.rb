require 'httparty'
require 'json'
require_relative 'config'

class Gitlab
  include Configuration
  response = HTTParty.get('http://gitlab.com/api/v3/groups/pencillabs',
                             headers: {"PRIVATE-TOKEN" => GITLAB_PRIVATE_TOKEN},
                             format: :json)
  @group = JSON.parse(response.body)

  def self.group_projects
    projects = @group["projects"].map{ |project| project["name"]}
    projects.to_s
  end
end

