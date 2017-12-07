package com.xiilab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xiilab.domain.Node;

public interface NodeRepository extends JpaRepository<Node, Long> {

}
