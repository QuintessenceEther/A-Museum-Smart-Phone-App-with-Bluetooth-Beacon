package com.kai.controller;

import com.kai.mapper.TypeMapper;
import com.kai.pojo.Author;
import com.kai.pojo.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TypeController {
    @Autowired
    TypeMapper typeMapper;

    //To list page
    @RequestMapping("/types")
    public String List(Model model){
        List<Type> types = typeMapper.getTypes();
        model.addAttribute("types",types);
        return "types/list";
    }

    //To add page
    @GetMapping("/type")
    public String toAddPage(Model model){
        return "types/add";
    }

    //add type
    @PostMapping("/type")
    public String addType(Type type){
        typeMapper.save(type);
        return "redirect:/types";
    }

    //to update page
    @GetMapping("/type/{id}")
    public String toUpdatepage(@PathVariable("id")int id, Model model){
        Type type = typeMapper.get(id);
        model.addAttribute("type",type);
        return "types/update";
    }

    //update type
    @PostMapping("/updateType")
    public String updateType(Type type){
        typeMapper.update(type);
        return "redirect:/types";
    }

    //delete type
    @GetMapping("/deleteType/{id}")
    public String deleteType(@PathVariable("id")int id){
        typeMapper.delete(id);
        return "redirect:/types";
    }
}
