module ApplicationHelper
  def default_meta_tags
    {
        site: "takaaa220 Tech Blog",
        title: "takaaa220 Tech Blog",
        description: "渋谷のベンチャー企業でバックエンドもフロントエンドも粛々と書いているエンジニアの個人ブログ．主にサーバはRuby，フロントはReactを書いています．",
        keywords: "rails,ruby,react,バックエンド,フロントエンド",
        icon: [
            { href: image_tag("/takaaa220.png") },
            { href: image_tag("/takaaa220.png"), rel: 'apple-touch-icon', sizes: '180x180',type: 'image/png' }
        ],
        noindex: !Rails.env.production?,
        canonical: request.original_url,
        charset: 'UTF-8',
        og: {
            title: :title,
            description: :description,
            type: "website",
            url: request.original_url,
            image: image_tag("/takaaa220.png"),
            site_name: "Engineer.new(name: 'takaaa220')",
            locale: "ja_JP"
        },
        twitter: {
            site: "@takaaa220",
            card: "summary",
            image: image_tag("/takaaa220.png")
        }
    }
  end
end
