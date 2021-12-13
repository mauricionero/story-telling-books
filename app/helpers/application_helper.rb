module ApplicationHelper
  def permission_link_to *args
    link_to *args if has_permission *args
  end

  def has_permission *args
    controller_action = controller_action args
    model_class = model_class args

    p '====controller_action'
    p controller_action
    p '====model_class'
    p model_class

    can? controller_action, model_class
  end

  def controller_action args
    return controller_and_action(args[1])[:action].to_sym if args[1].class == String
    return :show if args[2].nil?
    
    args[2][:method].downcase.to_sym
  end

  def model_class args
    return controller_and_action(args[1])[:controller].singularize.classify.constantize if args[1].class == String

    args[1].class
  end

  def controller_and_action uri
    Rails.application.routes.recognize_path uri
  end
end
