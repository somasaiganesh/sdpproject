package com.klef.jfsd.springboot.repository;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;


@Repository
public interface CourseRepository extends JpaRepository<Course, Integer>{

}
