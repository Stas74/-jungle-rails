class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, :length => {:minimum => 6 }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true


  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = self.find_by_email(email)
    if user && user.authenticate(password)
      user    
    else
      nil
    end
  end

end
