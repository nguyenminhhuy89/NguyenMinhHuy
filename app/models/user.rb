class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  SUPER_ADMIN_EMAIL = "abc@gmail.com"
  ADMIN_EMAIL = "xyz@gmail.com"  

  def admin?
    self.email == ADMIN_EMAIL
  end

  def super_admin?
    self.email == SUPER_ADMIN_EMAIL
  end
end
