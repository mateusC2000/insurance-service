# frozen_string_literal: true

require 'sneakers'

Sneakers.configure amqp: 'amqp://localhost',
                    vhost: '/',
                    exchange: 'sneakers',
                    exchange_type: :direct,
                    daemonize: false,
                    workers: 4,
                    threads: 1,
                    prefetch: 10,
                    ack: true,
                    timeout_job_after: 5,
                    heartbeat: 2