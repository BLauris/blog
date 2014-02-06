class Post < ActiveRecord::Base
	validates :title, presence: true,
<<<<<<< HEAD
               length: { minimum: 5 }
=======
                    length: { minimum: 5 }
>>>>>>> master
end
