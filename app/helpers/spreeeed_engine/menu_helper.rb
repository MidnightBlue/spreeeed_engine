module SpreeeedEngine
  module MenuHelper
    def render_role_menu
      menu = ''

      items = root_menu if current_user_is_root?

      items.each do |label, attrs|
        if attrs[:path]
          menu += render_menu(label, attrs)
        else
          sub_menu   = ''
          paths      = []
          attrs[:children].each do |_label, _attrs|
            paths << _attrs[:path].split('/')[1]
            sub_menu += render_menu(_label, _attrs)
          end
          open       = paths.include?(params[:controller].to_s)
          open_css   = (open ? ' open' : '')
          block_css  = (open ? ' style="display: block;"' : '')

          menu += %Q|<li class="parent#{open_css}"><a href="#"><i class="#{attrs[:icon_css]}"></i><span>#{label}</span></a>|
          menu += %Q|<ul class="sub-menu"#{block_css}>|
          menu += sub_menu
          menu += '</ul>'
          menu += '</li>'
        end
      end

      menu.html_safe

    end

    def root_menu
      menu = ActiveSupport::OrderedHash.new
      menu[t('menu.frontend').to_sym] = {
        :icon_css => 'fa-home',
        :path     => root_path,
      }

      menu[t('operations.sign_out').to_sym] = {
        :icon_css => 'fa-sign-out',
        :path     => send("destroy_#{SpreeeedEngine.devise_auth_resource}_session_path"),
      }

      menu
    end

    def render_menu(label, attrs)
      icon_css   = attrs[:icon_css]
      path       = attrs[:path]

      # active     = (path == root_path ? (request.path == path) : request.path.match(path))
      active     = (request.path == path)
      active_css = (active ? ' class="active"' : '')

      %Q|<li#{active_css}><a href="#{path}"><i class="fa #{icon_css}"></i>&nbsp;&nbsp;<span>#{label}</span></a></li>|
    end
  end
end
