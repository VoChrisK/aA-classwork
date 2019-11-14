require_relative "questionsdatabase.rb"

class User

  attr_accessor :fname, :lname
  def self.find_by_name(fname, lname)
    object = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT
      *
    FROM
      users
    WHERE
      fname = ? AND lname = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
    
  end

  def authored_questions
    objects = Question.find_by_author_id(@id)

    objects.map do |object|
      Question.new(object)
    end
  end

  def authored_replies
    objects = Reply.find_by_user_id(@id)

    objects.map do |object|
      Reply.new(object)
    end
  end
end