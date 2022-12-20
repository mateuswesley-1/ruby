class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(student)
    grade > student.grade
  end

  private

  def grade
    @grade
  end

end
