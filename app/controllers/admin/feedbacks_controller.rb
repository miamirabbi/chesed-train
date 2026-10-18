module Admin
  class FeedbacksController < DashboardsController
    add_breadcrumb 'Feedback', :admin_feedbacks_path
    before_action :set_feedback, only: %i[show destroy]

    def index
      @feedbacks = Feedback.recent
      @feedbacks = @feedbacks.where(category: params[:category]) if Feedback::CATEGORIES.include?(params[:category])
    end

    def show
      add_breadcrumb @feedback.display_category
    end

    def destroy
      @feedback.destroy
      redirect_to admin_feedbacks_path, notice: 'Deleted.'
    end

    private

    def set_feedback
      @feedback = Feedback.find(params[:id])
    end
  end
end
