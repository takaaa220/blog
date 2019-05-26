class PublishPostService
  attr_reader :post
  def call(post)
    @post = post
    publish_post
  end

  private

  def after_changed_time
    post.published? ? nil : Time.zone.now
  end

  def publish_post
    post.update(published: !post.published, published_at: after_changed_time)
  end
end