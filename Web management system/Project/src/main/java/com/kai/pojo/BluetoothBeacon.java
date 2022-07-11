package com.kai.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BluetoothBeacon {

  private int id;
  private String UUID;
  private int major;
  private int minor;


}
