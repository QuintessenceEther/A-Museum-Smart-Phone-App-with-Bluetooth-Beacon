package com.kai.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Exhibit {

  private int id;
  private String name;
  private String date;
  private String voiceDescription;

//  private Author author;
//  private Object type;
//  private Room room;
//  private BluetoothBeacon bluetoothBeaconeacon;
  private Author author;
  private Type type;
  private Room room;
  private BluetoothBeacon bluetoothBeacon;


}
