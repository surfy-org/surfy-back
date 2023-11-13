module Api
  module V0
    class BaseController < Api::V0::ApplicationController
      
      skip_before_action :verify_authenticity_token
      before_action :allow_cors

      def allow_cors
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = %w[GET POST PUT PATCH DELETE].join(',')
        headers['Access-Control-Allow-Headers'] =
          %w[Origin Accept Content-Type X-Requested-With X-CSRF-Token Authorization].join(',')
      end

      def check
          render json: { status: :ok }
      end

      def render_error(code:, message:, status:)
        render json: { "error": { "code": code, "message": message } }, status: status
      end


    end  
  end
end