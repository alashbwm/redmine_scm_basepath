require_dependency 'repositories_helper'

module ScmBasepath 
  module RepositoriesHelperPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
        alias_method_chain :repository_field_tags, :scm_basepath
      end
    end

    module InstanceMethods
      def repository_field_tags_with_scm_basepath(form, repository)
        tags = repository_field_tags_without_scm_basepath(form, repository) || ""
        return tags unless repository.class.name == "Repository::Git"
        myscmbasepath = Setting.plugin_redmine_scm_basepath[:git_path] || ""
        tags.gsub('value=""','').gsub('<input',"<input value=\"#{myscmbasepath}\"")
      end

    end
  end
end

RepositoriesHelper.send(:include, ScmBasepath::RepositoriesHelperPatch)
