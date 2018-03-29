require 'ostruct'

class Author
  attr_accessor :first_name, :last_name, :genre

  def author
    OpenStruct.new(first_name: first_name, last_name: last_name, genre: genre)
  end

  def method_missing(method_name, *arguments, &block)
    if method_name.to_s =~ /author_(.*)/
      author.send($1, *arguments, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('author_') || super
  end


end

author = Author.new
author.first_name = "Cal"
author.last_name = "Newpot"
author.genre = "Computer Science"

p author.author_genre

p author.respond_to?(:inspect) # returns true
p author.respond_to?(:author_genre) # returns false # considered an anti patturn # add respond_to_missing? method # now returns true





# $1 is the information you have right now

# creates methods on the fly with    author_   so it wont error out. saving 
# unmethod methods


# def respond_to_missing? method  is the better practice
# all on one line and 

# now know how to create
































