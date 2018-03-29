class String 
  def censor bad_word
    self.gsub!("#{bad_word}","CENSORED")
  end
end


p "The bunny was in trouble with the king's bunny".censor("bunny")
# patching into the String Class.
# check it out in the rails console  String.methods.sort
# 