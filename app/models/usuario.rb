class Usuario < ApplicationRecord
    validates :nombre, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
