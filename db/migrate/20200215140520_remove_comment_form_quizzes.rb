class RemoveCommentFormQuizzes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quizzes, :comment, :text
  end
end
