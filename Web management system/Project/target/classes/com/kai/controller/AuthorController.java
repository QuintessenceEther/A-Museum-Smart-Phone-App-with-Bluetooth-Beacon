package com.kai.controller;

import com.kai.mapper.AuthorMapper;
import com.kai.pojo.Author;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AuthorController {

    @Autowired
    AuthorMapper authorMapper;

    //To list page
    @RequestMapping("/authors")
    public String List(Model model){
        List<Author> authors = authorMapper.getAuthors();
        model.addAttribute("authors",authors);
        return "authors/list";
    }

    //To add page
    @GetMapping("/author")
    public String toAddPage(Model model){
        return "authors/add";
    }

    //add author
    @PostMapping("/author")
    public String addAuthor(Author author){
        authorMapper.save(author);
        return "redirect:/authors";
    }

    //to update page
    @GetMapping("/author/{id}")
    public String toUpdatepage(@PathVariable("id")int id, Model model){
        Author author = authorMapper.get(id);
        model.addAttribute("author",author);
        return "authors/update";
    }

    //update author
    @PostMapping("/updateAuthor")
    public String updateAuthor(Author author){
        authorMapper.update(author);
        return "redirect:/authors";
    }

    //delete author
    @GetMapping("/deleteAuthor/{id}")
    public String deleteAuthor(@PathVariable("id")int id){
        authorMapper.delete(id);
        return "redirect:/authors";
    }
}
