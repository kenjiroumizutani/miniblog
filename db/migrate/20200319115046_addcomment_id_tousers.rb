class AddcommentIdTousers < ActiveRecord::Migration[5.2]
  def change
    t.integer :comment_id
    t.integer :tweet_id
  end
end
