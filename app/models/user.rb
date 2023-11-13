class User < ActiveRecord::Base
    validates :email, uniqueness: true, allow_nil: true
    validates :email, format: /@/, if: -> { email.present? }
    validates :first_name, :last_name, presence: true
end