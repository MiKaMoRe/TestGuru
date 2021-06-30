module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(**data)
    link_to data[:title],
            "https://github.com/#{data[:author]}/#{data[:repo]}",
            target: '_blank'
  end

  def flash_message
    content_tag :p, flash[:alert], class: 'flash alert'
  end
end
