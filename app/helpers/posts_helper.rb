module PostsHelper

    def loved?(post)
        heart = Heart.where(sessions: session[:current_user], post_id: post.id)

        if heart.empty?
            false
        else
            true
        end
    end
end
