require 'dispatcher'
Dispatcher.to_prepare do
  require_dependency 'scm_basepath/repositories_helper_patch'
end

Redmine::Plugin.register :redmine_scm_basepath do
  name 'Redmine Scm Basepath plugin'
  author 'Albert Lash'
  description 'This allows a default basepath'
  version '0.0.1'
  url 'https://github.com/alashbwm/redmine_scm_basepath'
  author_url 'http://example.com/about'
  settings :default => { "git_path" => "/" }
end
