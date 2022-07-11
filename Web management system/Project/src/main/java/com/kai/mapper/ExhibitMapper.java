package com.kai.mapper;

import com.kai.pojo.Exhibit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ExhibitMapper {
    //Get all information of the exhibits
    List<Exhibit> getExhibits();
    //Get exhibit by id
    Exhibit get(int id);
    //add a new exhibit
    int save(Exhibit exhibit);
    //change the information of a exhibit
    int update(Exhibit exhibit);
    //Delete exhibit by id
    int delete(int id);

}
