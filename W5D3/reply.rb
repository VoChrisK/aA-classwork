require_relative "questionsdatabase.rb"

class Reply
  attr_accessor :reply_id, :question_id, :parent_id, :user_id, :body

  def self.find_by_user_id(user_id)
    object = QuestionDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      *
    FROM
      replies
    WHERE
      user_id = ?
    SQL

    object
  end

  def self.find_by_question_id(question_id)
    object = QuestionDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      *
    FROM
      replies
    WHERE
      question_id = ?
    SQL

    object
  end

  def initialize(options)
    @reply_id = options['reply_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end
  
end