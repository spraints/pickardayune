class User < Omnisocial::User
  ROLE = %W(admin none)
  validates :role, :inclusion => ROLE

  # Make any customisations here
  def can?(action, resource, options = {})
    resource = resource.model_name if resource.is_a?(Class)

    return false if !resources.include?(resource)
    return true if resources[resource].include?("all")

    action = options[:special] ? action : action.acl_action_mapper

    resources[resource].extract_settings.include?(action)
  end

  def cannot?(*args)
    !can?(*args)
  end

  def is_root?
    role == Typus.master_role
  end

  def is_not_root?
    !is_root?
  end

  def locale
    ::I18n.locale
  end

  def resources
    (Typus::Configuration.roles[role] || {}).compact
  end

  def applications
    resources.keys.collect { |resource| Typus::Configuration.config[resource]['application'] }.uniq
  end

  def application(name)
    applications.include?(name) ? Typus.application(name) : []
  end

  def status
    true
  end
end
