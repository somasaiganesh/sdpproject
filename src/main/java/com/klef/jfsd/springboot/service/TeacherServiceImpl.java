package com.klef.jfsd.springboot.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Teacher;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.repository.TeacherRepository;

@Service
public class TeacherServiceImpl implements TeacherService
{
	

	@Autowired
	private TeacherRepository teacherRepository;
	@Autowired
	private StudentRepository studentRepository;
	@Override
	public Teacher checkteacherlogin(String username, String password) {
		   return teacherRepository.checkteacherlogin(username, password);
		}

	@Override
	public long studentcount() {
		return studentRepository.count();

	}

	
	@Override
	public List<Student> ViewStudents() {
	    List<Student> students = studentRepository.findAll();
	    System.out.println("Fetched students: " + students);
	    return students;
	}

	@Override
	public void deleteStudent(int id) {
		studentRepository.deleteById(id);
		return;
	}

	@Override
	public Student displayStudentByID(int id) {
		return studentRepository.findById(id).get();
	}

	@Override
	public String addstudent(Student student) {
		// TODO Auto-generated method stub
		studentRepository.save(student);
		return "student added successfully";
	}


	

	
}