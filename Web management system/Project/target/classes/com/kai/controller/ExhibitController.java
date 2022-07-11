package com.kai.controller;

import com.kai.mapper.*;
import com.kai.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ExhibitController {

    @Autowired
    ExhibitMapper exhibitMapper;
    @Autowired
    AuthorMapper authorMapper;
    @Autowired
    BeaconMapper beaconMapper;
    @Autowired
    RoomMapper roomMapper;
    @Autowired
    TypeMapper typeMapper;
    //List page
    @RequestMapping("/exhibits")
    public String list(Model model){
        List<Exhibit> exhibits = exhibitMapper.getExhibits();
        model.addAttribute("exhibits",exhibits);
        return "exhibits/list";
    }

    //Add page
    @GetMapping("/exhibitPage")
    public String toAddpage(Model model){
        List<Author> authors = authorMapper.getAuthors();
        List<BluetoothBeacon> beacons = beaconMapper.getBluetoothBeacons();
        List<Room> rooms = roomMapper.getRooms();
        List<Type> types = typeMapper.getTypes();
        model.addAttribute("authors",authors);
        model.addAttribute("beacons",beacons);
        model.addAttribute("rooms",rooms);
        model.addAttribute("types",types);
        return "exhibits/add";
    }
    //Add exhibit
    @PostMapping("/exhibit")
    public String addExhibit(Model model,
                             Exhibit exhibit){
        List<Exhibit> exhibits = exhibitMapper.getExhibits();
        List<Author> authors = authorMapper.getAuthors();
        List<BluetoothBeacon> beacons = beaconMapper.getBluetoothBeacons();
        List<Room> rooms = roomMapper.getRooms();
        List<Type> types = typeMapper.getTypes();
        model.addAttribute("authors",authors);
        model.addAttribute("beacons",beacons);
        model.addAttribute("rooms",rooms);
        model.addAttribute("types",types);
        for (Exhibit value : exhibits) {
            if (exhibit.getRoom().getId() == value.getRoom().getId()) {
                model.addAttribute("msg", "There is already an exhibit in this room. Please choose another room");
                return "exhibits/add";
            }
            if (exhibit.getBluetoothBeacon().getId() == value.getBluetoothBeacon().getId()){
                model.addAttribute("msg", "This Bluetooth beacon already corresponds to an exhibit. please choose another Bluetooth beacon.");
                return "exhibits/add";
            }
        }
        exhibitMapper.save(exhibit);
        return "redirect:/exhibits";
    }

    //update page
    @GetMapping("/exhibit/{id}")
    public String toUpdatepage(@PathVariable("id") int id,Model model){
        List<Author> authors = authorMapper.getAuthors();
        List<BluetoothBeacon> beacons = beaconMapper.getBluetoothBeacons();
        List<Room> rooms = roomMapper.getRooms();
        List<Type> types = typeMapper.getTypes();
        model.addAttribute("authors",authors);
        model.addAttribute("beacons",beacons);
        model.addAttribute("rooms",rooms);
        model.addAttribute("types",types);
        Exhibit exhibit = exhibitMapper.get(id);
        model.addAttribute("exhibit",exhibit);
        return "exhibits/update";
    }

    //update exhibit
    @PostMapping("/updateExhibit")
    public String updateExhibit(Exhibit exhibit,
                                Model model){
        List<Exhibit> exhibits = exhibitMapper.getExhibits();
        List<Author> authors = authorMapper.getAuthors();
        List<BluetoothBeacon> beacons = beaconMapper.getBluetoothBeacons();
        List<Room> rooms = roomMapper.getRooms();
        List<Type> types = typeMapper.getTypes();
        model.addAttribute("authors",authors);
        model.addAttribute("beacons",beacons);
        model.addAttribute("rooms",rooms);
        model.addAttribute("types",types);
        for (Exhibit value : exhibits) {
            if(exhibit.getId() != value.getId()){
            if (exhibit.getRoom().getId() == value.getRoom().getId()) {
                model.addAttribute("msg", "There is already an exhibit in this room. Please choose another room");
                return "exhibits/update";
            }
            if (exhibit.getBluetoothBeacon().getId() == value.getBluetoothBeacon().getId()){
                model.addAttribute("msg", "This Bluetooth beacon already corresponds to an exhibit. please choose another Bluetooth beacon.");
                return "exhibits/update";
            }
            }
        }
        exhibitMapper.update(exhibit);
        return "redirect:/exhibits";
    }

    @GetMapping("/deleteExhibit/{id}")
    public String deleteExhibit(@PathVariable("id") int id){
        exhibitMapper.delete(id);
        return "redirect:/exhibits";
    }
}
