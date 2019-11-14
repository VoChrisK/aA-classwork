require_relative "questionsdatabase.rb"

class Question
  attr_accessor :title, :body, :author

  def self.find_by_id(other_id)
    object = QuestionsDatabase.instance.execute(<<-SQL, other_id)
    SELECT
      *
    FROM
      questions
    WHERE
      id = ?
    SQL

    Questions.new(object.first)
  end

  def self.find_by_author_id(author_id)
    object = QuestionDatabase.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      questions
    WHERE
      author_id = ?
    SQL

    Question.new(object.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author = options['author_id']
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

end