class AdminAuthorization < ActiveAdmin::AuthorizationAdaptor

	def authorized?(action, subject = nil)
		user && user.admin?
	end

end