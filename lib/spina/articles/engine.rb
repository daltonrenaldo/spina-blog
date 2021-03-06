module Spina
  module Articles
    class Engine < ::Rails::Engine
      isolate_namespace Spina

      def self.require_decorators
        [Engine.root].flatten.map { |p| Dir[p.join('app', 'decorators', '**', '*_decorator.rb')]}.flatten.uniq.each do |decorator|
          Rails.configuration.cache_classes ? require(decorator) : load(decorator)
        end
      end
      config.to_prepare &method(:require_decorators).to_proc

      initializer 'spina.plugin.register.articles', before: :load_config_initializers do
        Spina::Plugin.register do |plugin|
          plugin.name = "articles"
          plugin.namespace = "articles"
        end
      end

      initializer "spina.articles.append_migrations" do |app|
        unless app.root.to_s.match root.to_s
          config.paths["db/migrate"].expanded.each do |expanded_path|
            app.config.paths["db/migrate"] << expanded_path
          end
        end
      end

      config.after_initialize do
        # Since in routes.rb we are using prepend, we need to reload routes
        # Otherwise, spina's /*id routes will prevent us to ever get to our routes
        Rails.application.routes_reloader.reload!
      end
    end
  end
end
