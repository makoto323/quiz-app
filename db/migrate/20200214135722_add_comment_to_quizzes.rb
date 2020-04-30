class AddCommentToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :comment, :text
  end
end
