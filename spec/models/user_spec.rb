require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "user with all password fields set will save successfully" do
      @user = User.new(password: "123456", password_confirmation: "123456")     

      expect(@user).to be_valid
    end

    it "user with all password fields set will save successfully" do
      @user = User.new(password: "123456", password_confirmation: "11")     

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "user with same email set will fail" do
      @user = User.new(email: "example@example.com")
      @user2 = User.new(email: "example@example.com")

      expect(@user2).to_not be_valid
      
    end
    #4
    it "user with same email set will fail" do
      @user = User.new(email: "EXAMPLE@example.com")
      @user2 = User.new(email: "example@example.com")

      expect(@user2).to_not be_valid
    end
    #5
    it "fail if first name field is empty" do
      @user = User.new(first_name: nil, last_name: "Smith", email: "example@example.com")
      

      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("email confirmation ")
    end

    it "fail if last name field is empty" do
      @user = User.new(first_name: "Alan", last_name: nil, email: "example@example.com")
      

      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("email confirmation ")
    end
    # 7
    it "fail if email field is empty" do
      @user = User.new(first_name: "Alan", last_name: "Smith", email: nil)
      

      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("email confirmation ")
    end

    it "fail if password lenght less then 6" do
      @user = User.new(password: "12345", password_confirmation: "12345")
      

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end   

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
  
end


# @product = Product.new(name: "Purple carrot", price: 10, quantity: 5, category: @category)
# user = User.new(user_params)
# def user_params
#   params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
# end