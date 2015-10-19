class Post < ActiveRecord::Base
<<<<<<< HEAD
	acts_as_votable
=======
>>>>>>> 35a57fe8bcbbf4e5b671aedcfac150f8c7c10867

	belongs_to :user
	validates_presence_of :body
	has_many :comments, dependent: :destroy
	
<<<<<<< HEAD
	def cached_votes_score
	  self.get_upvotes.size - self.get_downvotes.size
=======
	acts_as_votable
	def score
	  self.get_upvotes.size
>>>>>>> 35a57fe8bcbbf4e5b671aedcfac150f8c7c10867
	end

end
