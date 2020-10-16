package com.htl.repository;

import com.htl.entity.User;

public interface UserRepository {
    public User findById(long id);
}

