module AuthorizationHelpers
  def define_permission!(user, action, thing)
    Permission.create!(user: user,
                       action: action,
                       thing: thing)
	end 
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end

#Why use an AuthorizationHelper here instead of a Factory to create a permission?