package com.htl.repository;

import com.htl.entity.User;

public interface UserRepository {
    public User login(String username, String password);
}

