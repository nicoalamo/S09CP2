require 'date'

class Course

  attr_accessor :course_name, :begin_date, :final_date

  def initialize(name, beginning, final)
    @course_name = name
    @begin_date = Date.parse(beginning)
    @final_date = Date.parse(final)
  end

  def Course.build(file_name)

    courses = []
    file = File.open(file_name, 'r')
    data = file.readlines

    data.each do |line|
      line_array = line.chomp.split(', ')
      course_name = line_array[0]
      begin_date = line_array[1]
      final_date = line_array[2]
      courses << new(course_name, begin_date, final_date)
    end

    file.close
    courses

  end

  def Course.check_beggin_date(date_arg)
    date_to_check = Date.parse(date_arg)
    courses = build('cursos.txt')
    courses.each do |course|
      if course.begin_date < date_to_check
        puts "El curso #{course.course_name} comienza el #{course.begin_date}, que es antes del #{date_to_check}"
      end
    end

  end

  def Course.check_final_date(date_arg)
    date_to_check = Date.parse(date_arg)
    courses = build('cursos.txt')
    courses.each do |course|
      if course.final_date > date_to_check
        puts "El curso #{course.course_name} finaliza el #{course.final_date}, que es posterior al #{date_to_check}"
      end
    end

  end

  #Course.check_beggin_date('2017-05-01')
  Course.check_final_date('2017-09-01')


end
