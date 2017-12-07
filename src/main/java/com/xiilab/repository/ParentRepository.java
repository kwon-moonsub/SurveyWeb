package com.xiilab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xiilab.domain.Parent;

public interface ParentRepository extends JpaRepository<Parent, String> {

}
