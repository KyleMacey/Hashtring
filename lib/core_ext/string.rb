String.class_eval do
  def **(hash)
    Hashtring::Constructor.new(self, hash)
  end
end
