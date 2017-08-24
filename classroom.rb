# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  grades = grade_hash[student]
    grades[assignment_num - 1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  grade_hash.map do |student, grades|
    grades[assignment_num - 1]
  end
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  array = grade_hash.map{|key, array| array[assignment_num-1]}
    newArray = array.reduce(0, :+)
    finalArray = newArray/10
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  grades = grade_hash.map do |avg, grades|
  [avg, (grades.sum)/grades.length]
end
grades.to_h
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  if score >= 90
   "A"
 elsif score >= 80
   "B"
 elsif score >= 70
   "C"
 elsif score >= 60
   "D"
 else
   "F"
 end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  data_hash = Hash.new()
  averages(grade_hash).map {|key, average| data_hash[key] = letter_grade(average)}
  data_hash
end

# Return the average for the entire class.
def class_average(grade_hash)
  stuff = []
    grade_hash.map do |key, value|
      stuff.push(*value)
end
  return stuff.reduce(:+)/stuff.length
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  grades = averages(grade_hash)
   sorted = grades.sort_by do |student, grade|
     -grade
   end
   students = sorted.map do |student, grade|
     student
   end
   students.take(number_of_students)
end
