class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller? 
    before_action :set_search

    def set_search
        @q = Room.ransack(params[:q]) 
        @search_rooms = @q.result
      end


    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username]) #サインアップアクション（新規登録）のusernameキーの値を取得
    end



    #def configure_account_update_parameters
     #   devise_parameter_sanitizer.permit(:account_update, keys: [:ここに編集したいカラム])
    #end
end
