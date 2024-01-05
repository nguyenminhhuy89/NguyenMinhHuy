class PostObserver < ActiveRecord::Observer
  def after_save(post)
    puts("test")
  end
end