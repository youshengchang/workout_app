class FriendshipsController < ApplicationController
    
    def create
        friend = User.find(params[:friend_id])
        Friendship.create(friendhsip_params.merge(friend_id: params[:friend_id], 
                user_id: current_user.id)) unless current_user.follows_or_same?(friend)
        redirect_to root_path
    end
    
    private
        def friendhsip_params
            params.permit(:friend_id, :user_id)
        end
end