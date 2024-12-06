package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Recommendations;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.RecommendationsRepository;

@Service
public class RecommendationsServiceImpl implements RecommendationsService{
	 @Autowired
	    private RecommendationsRepository recommendationsRepository;

	    public Recommendations saveRecommendation(Recommendations recommendation) {
	        return recommendationsRepository.save(recommendation);
	    }
	}


