package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Recommendations;
import com.klef.jfsd.springboot.model.Student;

public interface RecommendationsService {
	

	Recommendations saveRecommendation(Recommendations recommendation);

	List<Recommendations> getRecommendationsByStudent(Student student);
	

}
