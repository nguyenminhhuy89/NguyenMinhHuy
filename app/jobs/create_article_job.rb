class CreateArticleJob < ApplicationJob
  queue_as :default

  def perform
    Post.create(title: "test title #{DateTime.now.second}", content: 'test content')
  end
end
