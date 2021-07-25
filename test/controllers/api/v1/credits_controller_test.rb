# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CreditsControllerTest < ActionDispatch::IntegrationTest
      test 'should get index' do
        get api_v1_credits_index_url
        assert_response :success
      end

      test 'should get show' do
        get api_v1_credits_show_url
        assert_response :success
      end

      test 'should get create' do
        get api_v1_credits_create_url
        assert_response :success
      end

      test 'should get update' do
        get api_v1_credits_update_url
        assert_response :success
      end
    end
  end
end
