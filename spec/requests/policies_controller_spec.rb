# frozen_string_literal: true

require 'rails_helper'

describe 'Policy API' do
  context 'GET /v1/policies' do
    it 'returns all policies' do
      policy = Policy.new(number: '3003110007872', emission_date: Date.parse('2024-03-17'),
                          coverage_end_date: Date.parse('2026-03-17'))
      policy.vehicle = Vehicle.new(brand: 'McLaren', model: '765LT', year: '2020', plate: 'JOY-4213')
      policy.insured = Insured.new(name: 'Darth Vader', cpf: '206.596.120-11')
      policy.save!

      get '/v1/policies'
      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(parsed_body.first[:number]).to eq('3003110007872')
      expect(parsed_body.first[:emission_date]).to eq('2024-03-17')
      expect(parsed_body.first[:coverage_end_date]).to eq('2026-03-17')
      expect(parsed_body.first[:insured][:name]).to eq('Darth Vader')
      expect(parsed_body.first[:vehicle][:brand]).to eq('McLaren')
      expect(parsed_body.first[:vehicle][:model]).to eq('765LT')
    end

    it 'returns an empty array' do
      get '/v1/policies'

      expect(response.body).to eq('[]')
    end
  end

  context 'GET /v1/policies/:id' do
    it 'returns policy' do
      policy = Policy.new(number: '3003110007872', emission_date: Date.parse('2024-03-17'),
                          coverage_end_date: Date.parse('2026-03-17'))
      policy.vehicle = Vehicle.new(brand: 'McLaren', model: '765LT', year: '2020', plate: 'JOY-4213')
      policy.insured = Insured.new(name: 'Darth Vader', cpf: '206.596.120-11')
      policy.save!

      get "/v1/policies/#{policy.id}"
      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(parsed_body[:number]).to eq('3003110007872')
      expect(parsed_body[:emission_date]).to eq('2024-03-17')
      expect(parsed_body[:coverage_end_date]).to eq('2026-03-17')
      expect(parsed_body[:insured][:name]).to eq('Darth Vader')
      expect(parsed_body[:vehicle][:brand]).to eq('McLaren')
      expect(parsed_body[:vehicle][:model]).to eq('765LT')
    end

    it 'policy not found' do
      get '/v1/policies/999'
      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_body[:message]).to eq('Policy not found')
    end
  end
end
