package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Reports;

public interface ReportsService {
	
	public Reports addReport(Reports report);

	List<Reports> getAllReports();

}
