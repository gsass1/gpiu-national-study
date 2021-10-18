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
    flag_icon code.to_sym, class: "national-flag", width: "200"
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

  def unread_notifications_badge
    unread = current_user.unread_notifications_count
    if unread > 0
      content_tag :span, class: "badge badge-pill badge-danger unread-notifications-badge" do
        unread.to_s
      end
    end
  end

  def study_active?
    !@current_study_iteration.nil? && @current_study_iteration.active?
  end

  def current_study_iteration
    @current_study_iteration
  end

  def next_or_current_study_iteration
    @next_or_current_study_iteration
  end

  def sub_section(name, &block)
    content_tag :div, class: 'card mb-3' do
      (content_tag :div, class: "card-header bg-primary text-light" do
        content_tag :strong, name
      end) +
      (content_tag :div, class: "card-body" do
        yield
      end)
    end
  end

  def form_trigger(elem, condition)
    { data: { action: "change->questionnaire#onTriggerChange", condition: condition, elem: elem } }
  end

  def antibiotics_group(form, group)
    trigger_div = "#{form.object.pos_id}_#{group}_div"

    (content_tag :div do
      form.input "#{group}_group", as: :boolean, label: t(".#{group}.group"), input_html: form_trigger(trigger_div, "true")
    end) +
    ( content_tag :div, id: trigger_div do
        form.input group.to_sym, label: "", as: :radio_buttons, collection: radio_button_collection(group.to_s, *form.object.class.send(group.to_s.pluralize.to_sym).keys), label_method: :second, value_method: :first
      end)

    #form.input group.to_sym, as: :radio_buttons, collection: radio_button_collection(group.to_s.pluralize, *form.object.class.send(group.to_s.pluralize.to_sym).keys), label_method: :second, value_method: :first
  end

  def no_header_margin?
    defined?(@no_header_margin) && @no_header_margin == true
  end

  def disable_header_margin
    @no_header_margin = true
  end
end
