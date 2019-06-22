class UserPageController < ApplicationController
  before_action :set_archives
  before_action :set_populars

  def set_archives
    # TODO: 月ごとに集計する
    @archives = Post.count_per_month
  end

  def set_populars
    # TODO: よく読まれている記事を抜粋する
    @populars = []
  end
end