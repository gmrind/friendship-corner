class Comment < ActiveRecord::Base
<<<<<<< HEAD
	acts_as_votable
	belongs_to :user
	belongs_to :post
	validates_presence_of :body

	def cached_votes_score
	  self.get_upvotes.size - self.get_downvotes.size
=======
	belongs_to :user
	belongs_to :post

	validates_presence_of :body

	acts_as_votable
	def score
	  self.get_upvotes.size
>>>>>>> 35a57fe8bcbbf4e5b671aedcfac150f8c7c10867
	end
end
