module Api
  module V0
    class UsersController < Api::V0::BaseController
      before_action :set_user!, only: %i[show update destroy]

      def index
        users = User.all
        render json: users
      end

      def show
        render json: current_user
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user
        else
          render_error(code: 'CANNOT CREATE', message: "Could not create user : #{user.errors.full_messages}",
                       status: 409)
        end
      end

      def update

        if current_user.update(user_params)
          render json: current_user
        else
          render_error(code: 'CANNOT CREATE', message: "Could not create user : #{current_user.errors.full_messages}",
                       status: 409)
        end
      end

      def destroy
        if current_user.destroy()
          render json: { status : 200}
        else
          render_error(code: 'CANNOT DELETE', message: "Could not delete user : #{current_user.errors.full_messages}",
                       status: 409)
        end
      end

      private

      def current_user
        @user ||= User.where(id: params[:id]).first
      end

      def set_user!
        return if current_user

        render_error(code: 'CANNOT_FIND_USER', message: 'Can not find user',
                     status: 404)
      end

      def user_params
        params.permit(:first_name, :last_name)
      end
    end
  end
end
