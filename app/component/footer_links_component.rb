# frozen_string_literal: true

class FooterLinksComponent < ViewComponent::Base
  def initialize(current_user)
    super()
    @current_user = current_user.is_a?(Hash) ? current_user[:current_user] : current_user
  end

  def left_column_links
    [
      { url: "/simulator", text: "layout.link_to_simulator" },
      { url: "/learn", text: "layout.link_to_learn_more", target: "_blank" },
      { url: "/docs", text: "layout.link_to_docs", target: "_blank" },
      user_specific_link
    ]
  end

  def right_column_links
    [
      { url: "https://www.hm.edu/impressum", text: "layout.footer.link_to_impressum", target: "_blank" },
      { url: "https://www.hm.edu/datenschutz", text: "layout.footer.link_to_datenschutz", target: "_blank" }
    ]
  end

  def forum_enabled?
    Flipper.enabled?(:forum)
  end

  private

    def user_specific_link
      if @current_user
        { url: "/users/#{@current_user.id}", text: "layout.footer.my_circuits" }
      else
        { url: "/users/sign_in", text: "login" }
      end
    end
end
