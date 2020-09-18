module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

  def icon_class_for_flash(flash_type)
    case flash_type
    when 'success'
      'check_circle'
    when 'error'
      'error'
    when 'alert'
      'warning'
    when 'notice'
      'announcement'
    else
      flash_type.to_s
    end
  end

  def is_landing_page?
    controller_name == "site" && action_name == "index"
  end

  def flag_image(code)
    image_tag "https://www.countryflags.io/#{code.downcase}/flat/48.png", class: "national-flag"
  end
  def admin_sidepanel_link(resource)
    content_tag :li do
      link_to "/admin/#{resource}" do
        content_tag :strong do
          controller_name == resource ? "> #{resource}" : resource
        end
      end
    end
  end
end
