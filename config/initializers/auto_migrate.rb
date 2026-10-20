# Render's dashboard build command may skip db:migrate, so apply pending migrations on boot in production.
Rails.application.config.after_initialize do
  next unless Rails.env.production? && ENV["SKIP_AUTO_MIGRATE"].blank?

  begin
    context = ActiveRecord::Base.connection_pool.migration_context
    if context.needs_migration?
      Rails.logger.info("[auto_migrate] Running pending migrations")
      context.migrate
      ActiveRecord::Base.connection.schema_cache.clear!
      ActiveRecord::Base.descendants.each(&:reset_column_information)
    end
  rescue => e
    Rails.logger.error("[auto_migrate] #{e.class.name}: #{e.message}")
  end
end
