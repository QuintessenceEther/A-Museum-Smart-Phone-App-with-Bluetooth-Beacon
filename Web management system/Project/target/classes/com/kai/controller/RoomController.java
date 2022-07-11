package com.kai.controller;

import com.kai.mapper.RoomMapper;
import com.kai.pojo.Author;
import com.kai.pojo.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class RoomController {
    @Autowired
    RoomMapper roomMapper;

    //to list page
    @RequestMapping("/rooms")
    public String list(Model model){
        List<Room> rooms = roomMapper.getRooms();
        model.addAttribute("rooms",rooms);
        return "rooms/list";
    }
    //to add page
    @GetMapping("/room")
    public String toAddpage(Model model){
        return "rooms/add";
    }

    //add room
    @PostMapping("/room")
    public String addRoom(Room room){
        roomMapper.save(room);
        return "redirect:/rooms";
    }

    //to update page
    @GetMapping("/room/{id}")
    public String toUpdatepage(@PathVariable("id")int id, Model model){
        Room room = roomMapper.get(id);
        model.addAttribute("room",room);
        return "rooms/update";
    }

    //update room
    @PostMapping("/updateRoom")
    public String updateRoom(Room room){
        roomMapper.update(room);
        return "redirect:/rooms";
    }

    //delete room
    @GetMapping("/deleteRoom/{id}")
    public String deleteRoom(@PathVariable("id")int id){
        roomMapper.delete(id);
        return "redirect:/rooms";
    }
}
