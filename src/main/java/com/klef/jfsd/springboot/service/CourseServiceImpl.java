package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Override
    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

	@Override
	public Course getCourseById(int cid) {
		return courseRepository.findById(cid).orElseThrow(() -> new RuntimeException("Course not found"));
    }
	public Course getCourseById(Integer cid) {
	    return courseRepository.findById(cid).orElse(null);
	}


}
