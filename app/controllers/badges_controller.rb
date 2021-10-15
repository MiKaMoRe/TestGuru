class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges_unlocked = current_user.badges
    @badges_all = Badge.all
  end
end
