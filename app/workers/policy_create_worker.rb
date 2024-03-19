# frozen_string_literal: true

class PolicyCreateWorker
  include Sneakers::Worker

  from_queue 'policy.created'

  def work(message)
    Rails.logger.info('Initializing the process...')
    payload = JSON.parse(message)

    Rails.logger.info('policy creation...')
    Rails.logger.info(payload.to_s)
    ack!
  end
end
