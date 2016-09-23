class Tweet
   attr_accessor :username, :text
   
   def initialize(username, text)
    self.username = username
    self.text = text
   end
end