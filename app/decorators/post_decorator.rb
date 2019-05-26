class PostDecorator < ApplicationDecorator
  delegate_all

  def published_time
    published_at.strftime('%Y年%m月%d日')
  end
end
