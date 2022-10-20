require './task3.rb'
require 'minitest/autorun'


class TestTask3 < Minitest::Unit::TestCase

    # call before each test
    def setup
        @students = [
            Student.new("name-1", "surname-1", "patronymic-1", Date.new(2000, 3, 10), "address-1", "phone-1", "faculty-1", 1, "gr-1"),
            Student.new("name-2", "surname-2", "patronymic-2", Date.new(2001, 3, 10), "address-2", "phone-2", "faculty-2", 2, "gr-2"),
            Student.new("name-3", "surname-3", "patronymic-3", Date.new(2002, 3, 10), "address-3", "phone-3", "faculty-3", 3, "gr-3"),
            Student.new("name-4", "surname-4", "patronymic-4", Date.new(2003, 3, 10), "address-4", "phone-4", "faculty-1", 4, "gr-4"),
            Student.new("name-5", "surname-5", "patronymic-5", Date.new(2004, 3, 10), "address-5", "phone-5", "faculty-2", 5, "gr-5"),
            Student.new("name-6", "surname-6", "patronymic-6", Date.new(2005, 3, 10), "address-6", "phone-6", "faculty-3", 6, "gr-1"),
            Student.new("name-7", "surname-7", "patronymic-7", Date.new(2006, 3, 10), "address-7", "phone-7", "faculty-1", 1, "gr-1"),
            Student.new("name-8", "surname-8", "patronymic-8", Date.new(2007, 3, 10), "address-8", "phone-8", "faculty-2", 2, "gr-1"),
            Student.new("name-9", "surname-9", "patronymic-9", Date.new(2008, 3, 10), "address-9", "phone-9", "faculty-3", 3, "gr-1"),
            Student.new("name-10", "surname-10", "patronymic-10", Date.new(2001, 3, 10), "address-10", "phone-10", "faculty-1", 4, "gr-1"),
            Student.new("name-11", "surname-11", "patronymic-11", Date.new(2002, 3, 10), "address-11", "phone-11", "faculty-2", 5, "gr-2"),
            Student.new("name-12", "surname-12", "patronymic-12", Date.new(2004, 3, 10), "address-12", "phone-12", "faculty-3", 6, "gr-3"),
            Student.new("name-13", "surname-13", "patronymic-13", Date.new(2005, 3, 10), "address-13", "phone-13", "faculty-1", 1, "gr-4"),
            Student.new("name-14", "surname-14", "patronymic-14", Date.new(2006, 3, 10), "address-14", "phone-14", "faculty-2", 2, "gr-5"),
            Student.new("name-15", "surname-15", "patronymic-15", Date.new(2007, 3, 10), "address-15", "phone-15", "faculty-3", 3, "gr-1"),
            Student.new("name-16", "surname-16", "patronymic-16", Date.new(2008, 3, 10), "address-16", "phone-16", "faculty-1", 4, "gr-2"),
            Student.new("name-17", "surname-17", "patronymic-17", Date.new(2009, 3, 10), "address-17", "phone-17", "faculty-2", 5, "gr-3"),
            Student.new("name-18", "surname-18", "patronymic-18", Date.new(2001, 3, 10), "address-18", "phone-18", "faculty-3", 6, "gr-4"),
            Student.new("name-19", "surname-19", "patronymic-19", Date.new(2002, 3, 10), "address-19", "phone-19", "faculty-1", 1, "gr-5"),
            Student.new("name-20", "surname-20", "patronymic-20", Date.new(2003, 3, 10), "address-20", "phone-20", "faculty-2", 2, "gr-1"),
            Student.new("name-21", "surname-21", "patronymic-21", Date.new(2004, 3, 10), "address-21", "phone-21", "faculty-3", 3, "gr-2"),
            Student.new("name-22", "surname-22", "patronymic-22", Date.new(2005, 3, 10), "address-22", "phone-22", "faculty-1", 4, "gr-3"),
            Student.new("name-23", "surname-23", "patronymic-23", Date.new(2006, 3, 10), "address-23", "phone-23", "faculty-2", 5, "gr-4"),
            Student.new("name-24", "surname-24", "patronymic-24", Date.new(2007, 3, 10), "address-24", "phone-24", "faculty-3", 6, "gr-5"),
            Student.new("name-25", "surname-25", "patronymic-25", Date.new(2008, 3, 10), "address-25", "phone-25", "faculty-1", 1, "gr-1"),
            Student.new("name-26", "surname-26", "patronymic-26", Date.new(2009, 3, 10), "address-26", "phone-26", "faculty-2", 2, "gr-2"),
            Student.new("name-27", "surname-27", "patronymic-27", Date.new(2001, 3, 10), "address-27", "phone-27", "faculty-3", 3, "gr-3"),
            Student.new("name-28", "surname-28", "patronymic-28", Date.new(2002, 3, 10), "address-28", "phone-28", "faculty-1", 4, "gr-4"),
            Student.new("name-29", "surname-29", "patronymic-29", Date.new(2003, 3, 10), "address-29", "phone-29", "faculty-2", 5, "gr-5"),
            Student.new("name-30", "surname-30", "patronymic-30", Date.new(2004, 3, 10), "address-30", "phone-30", "faculty-3", 6, "gr-1")
        ]
    end

    def test_students_from_faculty
        # search for not-valid faculty 
        assert_equal([], StudentArrayFilter.get_students_from_faculty(@students, "f-1"))

        # from faculty-1
        expected = [
            Student.new("name-1", "surname-1", "patronymic-1", Date.new(2000, 3, 10), "address-1", "phone-1", "faculty-1", 1, "gr-1"),
            Student.new("name-4", "surname-4", "patronymic-4", Date.new(2003, 3, 10), "address-4", "phone-4", "faculty-1", 4, "gr-4"),
            Student.new("name-7", "surname-7", "patronymic-7", Date.new(2006, 3, 10), "address-7", "phone-7", "faculty-1", 1, "gr-1"),
            Student.new("name-10", "surname-10", "patronymic-10", Date.new(2001, 3, 10), "address-10", "phone-10", "faculty-1", 4, "gr-1"),
            Student.new("name-13", "surname-13", "patronymic-13", Date.new(2005, 3, 10), "address-13", "phone-13", "faculty-1", 1, "gr-4"),
            Student.new("name-16", "surname-16", "patronymic-16", Date.new(2008, 3, 10), "address-16", "phone-16", "faculty-1", 4, "gr-2"),
            Student.new("name-19", "surname-19", "patronymic-19", Date.new(2002, 3, 10), "address-19", "phone-19", "faculty-1", 1, "gr-5"),
            Student.new("name-22", "surname-22", "patronymic-22", Date.new(2005, 3, 10), "address-22", "phone-22", "faculty-1", 4, "gr-3"),
            Student.new("name-25", "surname-25", "patronymic-25", Date.new(2008, 3, 10), "address-25", "phone-25", "faculty-1", 1, "gr-1"),
            Student.new("name-28", "surname-28", "patronymic-28", Date.new(2002, 3, 10), "address-28", "phone-28", "faculty-1", 4, "gr-4")
        ]
        assert_equal(expected, StudentArrayFilter.get_students_from_faculty(@students, "faculty-1"))
    end

    def test_students_born_after_year 
        # no such students
        assert_equal([], StudentArrayFilter.get_students_born_after_year(@students, 2022))

        # > 2005
        expected = [
            Student.new("name-7", "surname-7", "patronymic-7", Date.new(2006, 3, 10), "address-7", "phone-7", "faculty-1", 1, "gr-1"),
            Student.new("name-8", "surname-8", "patronymic-8", Date.new(2007, 3, 10), "address-8", "phone-8", "faculty-2", 2, "gr-1"),
            Student.new("name-9", "surname-9", "patronymic-9", Date.new(2008, 3, 10), "address-9", "phone-9", "faculty-3", 3, "gr-1"),
            Student.new("name-14", "surname-14", "patronymic-14", Date.new(2006, 3, 10), "address-14", "phone-14", "faculty-2", 2, "gr-5"),
            Student.new("name-15", "surname-15", "patronymic-15", Date.new(2007, 3, 10), "address-15", "phone-15", "faculty-3", 3, "gr-1"),
            Student.new("name-16", "surname-16", "patronymic-16", Date.new(2008, 3, 10), "address-16", "phone-16", "faculty-1", 4, "gr-2"),
            Student.new("name-17", "surname-17", "patronymic-17", Date.new(2009, 3, 10), "address-17", "phone-17", "faculty-2", 5, "gr-3"),
            Student.new("name-23", "surname-23", "patronymic-23", Date.new(2006, 3, 10), "address-23", "phone-23", "faculty-2", 5, "gr-4"),
            Student.new("name-24", "surname-24", "patronymic-24", Date.new(2007, 3, 10), "address-24", "phone-24", "faculty-3", 6, "gr-5"),
            Student.new("name-25", "surname-25", "patronymic-25", Date.new(2008, 3, 10), "address-25", "phone-25", "faculty-1", 1, "gr-1"),
            Student.new("name-26", "surname-26", "patronymic-26", Date.new(2009, 3, 10), "address-26", "phone-26", "faculty-2", 2, "gr-2")
        ]
        assert_equal(expected, StudentArrayFilter.get_students_born_after_year(@students, 2005))
    end

    def test_group_list
        # no such students
        assert_equal([], StudentArrayFilter.get_group_list(@students, "gr-6"))

        # students form group "gr-1"
        expected = [
            Student.new("name-1", "surname-1", "patronymic-1", Date.new(2000, 3, 10), "address-1", "phone-1", "faculty-1", 1, "gr-1"),
            Student.new("name-6", "surname-6", "patronymic-6", Date.new(2005, 3, 10), "address-6", "phone-6", "faculty-3", 6, "gr-1"),
            Student.new("name-7", "surname-7", "patronymic-7", Date.new(2006, 3, 10), "address-7", "phone-7", "faculty-1", 1, "gr-1"),
            Student.new("name-8", "surname-8", "patronymic-8", Date.new(2007, 3, 10), "address-8", "phone-8", "faculty-2", 2, "gr-1"),
            Student.new("name-9", "surname-9", "patronymic-9", Date.new(2008, 3, 10), "address-9", "phone-9", "faculty-3", 3, "gr-1"),
            Student.new("name-10", "surname-10", "patronymic-10", Date.new(2001, 3, 10), "address-10", "phone-10", "faculty-1", 4, "gr-1"),
            Student.new("name-15", "surname-15", "patronymic-15", Date.new(2007, 3, 10), "address-15", "phone-15", "faculty-3", 3, "gr-1"),
            Student.new("name-20", "surname-20", "patronymic-20", Date.new(2003, 3, 10), "address-20", "phone-20", "faculty-2", 2, "gr-1"),
            Student.new("name-25", "surname-25", "patronymic-25", Date.new(2008, 3, 10), "address-25", "phone-25", "faculty-1", 1, "gr-1"),
            Student.new("name-30", "surname-30", "patronymic-30", Date.new(2004, 3, 10), "address-30", "phone-30", "faculty-3", 6, "gr-1")
        ]
        assert_equal(expected, StudentArrayFilter.get_group_list(@students, "gr-1"))
    end



    def test_students_in_faculties_courses
        # ["f-1", "f-2"] and [1, 2, 3]
        expected = [
            #faculty-1
            [
                # 1
                [
                    Student.new("name-1", "surname-1", "patronymic-1", Date.new(2000, 3, 10), "address-1", "phone-1", "faculty-1", 1, "gr-1"),
                    Student.new("name-7", "surname-7", "patronymic-7", Date.new(2006, 3, 10), "address-7", "phone-7", "faculty-1", 1, "gr-1"),
                    Student.new("name-13", "surname-13", "patronymic-13", Date.new(2005, 3, 10), "address-13", "phone-13", "faculty-1", 1, "gr-4"),
                    Student.new("name-19", "surname-19", "patronymic-19", Date.new(2002, 3, 10), "address-19", "phone-19", "faculty-1", 1, "gr-5"),
                    Student.new("name-25", "surname-25", "patronymic-25", Date.new(2008, 3, 10), "address-25", "phone-25", "faculty-1", 1, "gr-1")
                ],

                # course 4
                [
                    Student.new("name-4", "surname-4", "patronymic-4", Date.new(2003, 3, 10), "address-4", "phone-4", "faculty-1", 4, "gr-4"),
                    Student.new("name-10", "surname-10", "patronymic-10", Date.new(2001, 3, 10), "address-10", "phone-10", "faculty-1", 4, "gr-1"),
                    Student.new("name-16", "surname-16", "patronymic-16", Date.new(2008, 3, 10), "address-16", "phone-16", "faculty-1", 4, "gr-2"),
                    Student.new("name-22", "surname-22", "patronymic-22", Date.new(2005, 3, 10), "address-22", "phone-22", "faculty-1", 4, "gr-3"),
                    Student.new("name-28", "surname-28", "patronymic-28", Date.new(2002, 3, 10), "address-28", "phone-28", "faculty-1", 4, "gr-4")
                ],

                # course 5
                [

                ]
            ],

            #faculty-2
            [
                # course 1
                [

                ],

                # course 4
                [

                ],

                # course 5
                [
                    Student.new("name-5", "surname-5", "patronymic-5", Date.new(2004, 3, 10), "address-5", "phone-5", "faculty-2", 5, "gr-5"),
                    Student.new("name-11", "surname-11", "patronymic-11", Date.new(2002, 3, 10), "address-11", "phone-11", "faculty-2", 5, "gr-2"),
                    Student.new("name-17", "surname-17", "patronymic-17", Date.new(2009, 3, 10), "address-17", "phone-17", "faculty-2", 5, "gr-3"),
                    Student.new("name-23", "surname-23", "patronymic-23", Date.new(2006, 3, 10), "address-23", "phone-23", "faculty-2", 5, "gr-4"),
                    Student.new("name-29", "surname-29", "patronymic-29", Date.new(2003, 3, 10), "address-29", "phone-29", "faculty-2", 5, "gr-5")
                ]
            ]
        ]
        assert_equal(expected, StudentArrayFilter.get_students_in_faculties_courses(@students, ["faculty-1", "faculty-2"], [1, 4, 5]))
    end
end