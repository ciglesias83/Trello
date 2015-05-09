class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :tasks
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, on: :create }
    validates :lastname, presence: true, format: { with: /\A[a-zA-Z]+\z/, on: :create }
    validates :member_username, presence: true, uniqueness: true, length: {maximum: 15}
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

    def fullname
      name + ' ' + lastname
    end

end
