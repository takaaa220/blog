default_tags = %w(Ruby Rails JavaScript React バックエンド フロントエンド 趣味)
default_tags.each do |tag|
  Tag.create(name: tag)
end