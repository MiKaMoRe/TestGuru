class GitHubClient < Octokit::Client

  def initialize(**params)
    super(params)
    @access_token = Rails.application.credentials.gits_access_token
  end
  
end
