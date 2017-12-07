package com.xiilab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xiilab.domain.Child;

public interface ChildRepository extends JpaRepository<Child, String> {

}
