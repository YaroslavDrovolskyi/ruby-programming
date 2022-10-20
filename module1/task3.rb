require 'date'

class Student
    attr_accessor :id, :name, :surname, :patronymic, :birthday, :address, :phone, :faculty, :course, :group

    @@id_count = 1

    def initialize(name, surname, patronymic, birthday, address, phone, faculty, course, group)
        @id = @@id_count
        @@id_count = @@id_count + 1 
        
        @name = name
        @surname = surname
        @patronymic = patronymic
        @birthday = birthday
        @address = address
        @phone = phone
        @faculty = faculty
        @course = course
        @group = group
    end

    
    def to_s
        return "#{id.to_s} #{@surname} #{@name} #{@patronymic}, #{@faculty}, #{@course.to_s} course, group: #{@group} "+
        "birthday: #{@birthday.to_s}, adress: #{@address}, phone: #{@phone}"
    end

    def ==(other)
        return !other.nil? && other.instance_of?(Student) &&
        @name == other.name && 
        @surname == other.surname && 
        @patronymic == other.patronymic && 
        @birthday.day == other.birthday.day && 
        @birthday.month == other.birthday.month && 
        @birthday.year == other.birthday.year && 
        @address == other.address && 
        @phone == other.phone && 
        @faculty == other.faculty &&
        @course == other.course &&
        @group == other.group
    end
end

class StudentArrayFilter

    def self.generate_random_students(number, faculties, groups)
        students = []
        for i in 1..number
            name = "name-" + i.to_s
            surname = "surname-" + i.to_s
            patronymic = "patronymic-" + i.to_s
            birthday = Date.new(rand(2000..2010), rand(1..12), rand(1...30))
            address = "address-" + i.to_s
            phone = "phone-" + i.to_s
            faculty = faculties[rand(faculties.length)]
            course = rand(1..6)
            group = groups[rand(groups.length)]

            students << Student.new(name, surname, patronymic, birthday, address, phone, faculty, course, group)
        end
        return students
    end

    def self.get_students_from_faculty(students, faculty)
        return students.select{|student|
            student.faculty == faculty
        }
    end


    def self.get_students_born_after_year(students, year)
        return students.select{|student|
            student.birthday.year > year
        }
    end

    def self.get_group_list(students, group)
        return students.select{|student|
            student.group == group
        }
    end

    def self.get_students_in_faculties_courses(students, faculties, courses)
        result = []

        for i in (0...(faculties.length))
            result << []
            for j in (0...(courses.length))
                result[i] << students.select{|student|
                    student.faculty == faculties[i] &&
                    student.course == courses[j]
                }  
            end
        end

        return result
    end

end

=begin
students = StudentArrayFilter.generate_random_students(10, ["f-1", "f-2"], ["gr-1", "gr-2", "gr-3"])
puts StudentArrayFilter.get_students_from_faculty(students, "f-1")

d = Date.new(2020, 10, 20)
puts d.day
=end