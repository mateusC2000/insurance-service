# frozen_string_literal: true

module V1
  class PoliciesController < ApplicationController
    def index
      policies = Policy.all

      render json: policies, each_serializer: PolicySerializer
    end

    def show
      policy = Policy.find(params[:id])
      render json: policy, serializer: PolicySerializer
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Policy not found' }, status: :not_found
    end
  end
end
