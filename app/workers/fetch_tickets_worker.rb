class FetchTicketsWorker
  include Sidekiq::Worker

  def perform
    @tickets = Ticket.inprogress.where.not(resolved_by_manager_at: nil)
    if @tickets.present?
      @tickets.each do |ticket|
        if ticket.resolved_by_manager_at <= Time.now-24.hours
          ticket.status = 2
          ticket.save
        end 
      end
    end
  end
end
