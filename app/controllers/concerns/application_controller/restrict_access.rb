class ApplicationController
  module RestrictAccess
    def require_login
      redirect_to root_url, alert:'Require login first.' unless current_user
    end
  end
end
