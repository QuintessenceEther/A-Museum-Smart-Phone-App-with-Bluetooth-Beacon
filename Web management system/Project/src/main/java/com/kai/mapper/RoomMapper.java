package com.kai.mapper;

import com.kai.pojo.Room;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface RoomMapper {
    //get all room
    List<Room> getRooms();
    //get room by id
    Room get(int id);
    //add room
    int save(Room room);
    //update room
    int update(Room room);
    //delete room
    int delete(int id);
}
