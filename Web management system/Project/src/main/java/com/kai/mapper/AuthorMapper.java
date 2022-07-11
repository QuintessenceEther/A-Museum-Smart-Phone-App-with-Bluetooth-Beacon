package com.kai.mapper;

import com.kai.pojo.Author;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AuthorMapper {
    //Get all information of author
    List<Author> getAuthors();
    //Get author by id
    Author get(int id);
    //add a new author;
    int save(Author author);
    //change the information of a author
    int update(Author author);
    //delete a author
    int delete(int id);
}
