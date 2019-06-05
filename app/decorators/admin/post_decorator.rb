class Admin::PostDecorator < ApplicationDecorator
  delegate_all

  def toggle_button
    button = published? ? "非公開" : "公開"
    helpers.button_to(button, helpers.toggle_admin_post_path(self), data: { confirm: "OKですか？"}, class: "Button" )
  end
end
