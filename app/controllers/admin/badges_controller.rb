class Admin::BadgesController < Admin::BaseController
  def new
    @badge = Badge.new()
  end

  def create
    badge = current_user.badges.build(badge_params)
    if badge.save
      redirect_to badges_path(badge)
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :description, :rule, :rule_value, :image_url)
  end
end
