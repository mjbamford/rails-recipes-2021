module Unauthorized
    def unauthorised
        flash[:alert] = "Swine! Don't be editing recipes you don't own!"
        redirect_to root_path
    end
end