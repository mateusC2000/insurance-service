# frozen_string_literal: true

Sneakers.configure(
  amqp: "amqp://guest:guest@rabbitmq:5672"
)

Sneakers.logger.level = Logger::INFO