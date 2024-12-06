package com.klef.jfsd.springboot.service;


import java.util.List;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Teacher;

public interface TeacherService  
{ 
	
 public Teacher checkteacherlogin(String username, String password);

 public long studentcount();

 public List<Student> ViewStudents();

 public void deleteStudent(int id);

public Student displayStudentByID(int id);

public String addstudent(Student student);




 
 
}