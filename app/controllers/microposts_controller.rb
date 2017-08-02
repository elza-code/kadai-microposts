class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
     @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    p params
    @micropost.destroy
    flash[:success] = 'メッセージを削除しました。'
    if params[:controller] == 'microposts'
      redirect_to root_url
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def reply
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.reply_id = params[:id]
    if @micropost.save
      flash[:success] = 'リプライメッセージを投稿しました。'
      redirect_to root_url
    else
      @microposts = current_user.microposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'リプライメッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  
   private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
  
     def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
       unless @micropost
        redirect_to root_url
       end
     end
end
