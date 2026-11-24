module Admin
  class EventsController < CheckRoleController
    def destroy
      @event = Event.find(params[:id])
      notice = begin
        @event.destroy ? 'Event deleted' : 'Event could not be deleted'
      rescue ActiveRecord::InvalidForeignKey => e
        Rails.logger.error("[admin event delete] #{e.message}")
        'Event could not be deleted because other records still point to it'
      end
      respond_to do |format|
        format.html { redirect_to admin_dashboard_path, notice: notice }
        format.js # You need a corresponding destroy.js.erb to handle the view update via AJAX
      end
    end
  end
end
