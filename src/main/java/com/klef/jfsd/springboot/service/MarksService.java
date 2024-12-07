package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Marks;
import com.klef.jfsd.springboot.model.Student;

public interface MarksService {
	public Marks getMarksById(int mid);

	public List<Marks> getAllMarks();

	public void saveMarks(Marks marks);

	public List<Marks> getMarksByStudentId(int studentId);

	

}
