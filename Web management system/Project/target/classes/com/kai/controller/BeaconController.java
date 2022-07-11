package com.kai.controller;

import com.kai.mapper.BeaconMapper;
import com.kai.pojo.BluetoothBeacon;
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
public class BeaconController {
    @Autowired
    BeaconMapper beaconMapper;

    //to list page
    @RequestMapping("/beacons")
    public String list(Model model){
        List<BluetoothBeacon> bluetoothBeacons = beaconMapper.getBluetoothBeacons();
        model.addAttribute("beacons",bluetoothBeacons);
        return "beacons/list";
    }
    //to add page
    @GetMapping("/beacon")
    public String toAddpage(Model model){
        return "beacons/add";
    }

    //add beacon
    @PostMapping("/beacon")
    public String addBeacon(BluetoothBeacon beacon){
        beaconMapper.save(beacon);
        return "redirect:/beacons";
    }

    //to update page
    @GetMapping("/beacon/{id}")
    public String toUpdatepage(@PathVariable("id")int id, Model model){
        BluetoothBeacon beacon = beaconMapper.get(id);
        model.addAttribute("beacon",beacon);
        return "beacons/update";
    }

    //update beacon
    @PostMapping("/updateBeacon")
    public String updateBeacon(BluetoothBeacon beacon){
        beaconMapper.update(beacon);
        return "redirect:/beacons";
    }

    //delete beacon
    @GetMapping("/deleteBeacon/{id}")
    public String deleteBeacon(@PathVariable("id")int id){
        beaconMapper.delete(id);
        return "redirect:/beacons";
    }
}
