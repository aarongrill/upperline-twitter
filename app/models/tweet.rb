class Tweet
   attr_accessor :username, :text
   
   TWEETS = []
   
   def initialize(username, text)
    self.username = username
    self.text = text
    
    TWEETS << self
   end
   
   def self.all
        TWEETS
   end
end