class GistQuestionService
  Struct.new('Gist', :html_url) do 
    def success?
      html_url.present?
    end
  end

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new
    @client.access_token = Rails.application.credentials.gits_access_token
  end

  def call
    gist = @client.create_gist(gist_params)
    Struct::Gist.new(gist.html_url)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-questions.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.description, *@question.answers.pluck(:description)].join("\n")
  end

end
