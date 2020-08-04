module PostsHelper
	def belongs_to_me?(post, user)
	  post.user_id == user.id
	end
end
