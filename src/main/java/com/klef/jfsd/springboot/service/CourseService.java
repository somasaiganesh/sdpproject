package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
@Service
public interface CourseService {
	public Course getCourseById(int cId);

	List<Course> getAllCourses();

}
