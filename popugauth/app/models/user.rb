class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_commit :sync

  def admin?
    role == 'admin'
  end

  def sync
    NotifyUpdatedUser.call(user: self)
  end
end
