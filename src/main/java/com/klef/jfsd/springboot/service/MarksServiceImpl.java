package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Marks;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.MarksRepository;
@Service
public class MarksServiceImpl implements MarksService{
	@Autowired
	private MarksRepository marksRepository;


	    public List<Marks> getAllMarks() {
	        return marksRepository.findAll();
	    }

	    public Marks getMarksById(int mid) {
	        return marksRepository.findById(mid).orElse(null);
	    }

		@Override
		public void saveMarks(Marks marks) {
			// TODO Auto-generated method stub
			
		}
		public List<Marks> getMarksByStudentId(int studentId) {
		    return marksRepository.findByStudentId(studentId);
		}



}
