package com.kai.mapper;

import com.kai.pojo.BluetoothBeacon;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BeaconMapper {
    //get all beacons
    List<BluetoothBeacon> getBluetoothBeacons();
    //get beacon by id
    BluetoothBeacon get(int id);
    //add beacon
    int save(BluetoothBeacon bluetoothBeacon);
    //update beacon
    int update(BluetoothBeacon bluetoothBeacon);
    //delete beacon
    int delete(int id);
}
