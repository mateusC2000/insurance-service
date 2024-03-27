# frozen_string_literal: true

class PolicyCreateWorker
  include Sneakers::Worker

  from_queue 'policy.created'

  def work(message)
    puts 'Starting message processing...'
    data = JSON.parse(message)

    ActiveRecord::Base.transaction do
      @policy = Policy.create!(
        number: policy_number_data,
        emission_date: emission_date_data,
        coverage_end_date: coverage_end_date_data
      )

      insured = Insured.create!(
        name: data['insured']['name'],
        cpf: data['insured']['cpf'],
        policy_id: @policy.id
      )

      vehicle = Vehicle.create!(
        plate: data['vehicle']['plate'],
        brand: data['vehicle']['brand'],
        model: data['vehicle']['model'],
        year: data['vehicle']['year'],
        policy_id: @policy.id
      )

      @policy.insured = insured
      @policy.vehicle = vehicle
      @policy.save!
    end

    puts "Policy #{@policy.number} successfully created!"
    ack!
  rescue ActiveRecord::RecordInvalid => error
    puts "Error creating policy: #{error}"
  end

  private

  def policy_number_data
    number = "300311#{rand.to_s[2..8]}"
  end

  def emission_date_data
    Time.zone.today
  end

  def coverage_end_date_data
    2.years.from_now
  end
end
