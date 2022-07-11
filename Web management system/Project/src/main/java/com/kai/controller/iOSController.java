package com.kai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.kai.mapper.*;
import com.kai.pojo.*;

import java.util.List;

@RestController
public class iOSController {
    @Autowired
    ExhibitMapper exhibitMapper;
    @Autowired
    UserMapper userMapper;

    @RequestMapping(value = "/test")
    public List<Exhibit> getList(){
        List<Exhibit> exhibits = exhibitMapper.getExhibits();
        return exhibits;
    }

    @RequestMapping(value = "/users")
    public List<User> getUsers(){
        List<User> users = userMapper.getUsers();
        System.out.println(users);
        return users;
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public int save(@RequestBody User user){
        System.out.println(user);
        userMapper.save(user);
        return 0;
    }
}
