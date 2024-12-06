package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Student;

public interface StudentService
{ 
	public String addStudent(Student student);
  public String updatestudent(Student s);
  public Student viewstudentbyid(int sid);  
  public Student checkstudentlogin(String email,String pwd);
  public String updatePasswordByEmail(String email, String newPassword);
  public Student findByEmail(String email);
  public String studentRegistraion(Student s);
  public Void saveStudent(Student s);
public Student getStudentByEmail(String email);
public void updateStudent(Student student);
public Student getStudentWithReports(int sid);
public Object getAllStudents();
public Student getStudentById(Long studentId);
  
}