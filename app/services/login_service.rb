class LoginService
  attr_accessor :email, :password

  def initialize(args={})
    @email = args[:email]
    @password = args[:password]
  end

  def call
    @user = User.find_by(email: email)
    @user if @user&.authenticate(@password)
  end
end