package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Reports;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.ReportsRepository;
@Service
public class ReportsServiceImpl implements ReportsService{
	@Autowired
	private ReportsRepository reportsRepository;
	public Reports addReport(Reports report) {
        return reportsRepository.save(report);
    }
	  @Override
	    public List<Reports> getAllReports() {
	        return reportsRepository.findAll(); // Fetch all reports from the repository
	    }
   

}
