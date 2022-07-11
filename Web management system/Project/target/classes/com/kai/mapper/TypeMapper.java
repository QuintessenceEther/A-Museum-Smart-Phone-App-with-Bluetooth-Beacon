package com.kai.mapper;

import com.kai.pojo.Type;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TypeMapper {
    //get all type
    List<Type> getTypes();
    //get type by id
    Type get(int id);
    //add type
    int save(Type type);
    //update type
    int update(Type type);
    //delete type
    int delete(int id);
}
