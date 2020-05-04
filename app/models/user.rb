class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :quizzes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_quizzes, through: :likes, source: :quiz
  attachment :profile_image

  validates :username, presence: true

  def already_liked?(quiz)
    self.likes.exists?(quiz_id: quiz.id)
  end
end
