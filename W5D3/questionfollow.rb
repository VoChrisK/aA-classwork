require_relative "questionsdatabase.rb"
require_relative "users.rb"
require_relative "questions.rb"

class QuestionFollow

  def self.followers_for_question_id(question_id)
    objects = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        (questions JOIN question_follows 
        ON questions.author_id = question_follows.author_id)
        AS followers JOIN users
        ON followers.user_id = users.user_id 
      WHERE
        questions.id = ?
    SQL

    objects.map do |object|
      User.new(object)
    end
  end

  def self.followed_questions_for_user_id(user_id)
    objects = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        (
         (questions JOIN question_follows 
        ON questions.author_id = question_follows.author_id)
        AS followers JOIN users
        ON followers.user_id = users.user_id) AS new_followers
      WHERE
        new_followers.author_id = ?
    SQL

    objects.map do |object|
      Question.new(object)
    end
  end


  def initialize(options)
    @author_id = options["author_id"]
    @user_id = options["user_id"]

  end









end