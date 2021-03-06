class  QuizzesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @quizzes = Quiz.all
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)
    @quiz.user_id = current_user.id
    if @quiz.save
      redirect_to quiz_path(@quiz), notice: "クイズを投稿しました。"
    else
      render :new
    end

    # @quiz = Quiz.new(quiz_params)
    # @quiz.user_id = current_user.id
    # if @quiz.save
    #   redirect_back(fallback_location: root_path)
    # else
    #   redirect_back(fallback_location: root_path)
    # end
  end

  def index
    @quizzes = Quiz.all.order(id: "DESC")
  end

  def show
    @quiz = Quiz.find(params[:id])
    @comment = Comment.new
    @comments = @quiz.comments.includes(:user)
    @like = Like.new
  end

  def edit
    @quiz = Quiz.find(params[:id])
    if @quiz.user != current_user
        redirect_to quizzes_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to quiz_path(@quiz), notice: "クイズを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    quiz = Quiz.find(params[:id])
    quiz.destroy
    redirect_to user_path(quiz.user), notice: "クイズを削除しました。"
  end

  private
  def quiz_params
    params.require(:quiz).permit(:title, :body, :image, :comment)
  end
end
