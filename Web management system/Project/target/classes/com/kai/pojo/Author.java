package com.kai.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Author {

  private int id;
  private String name;
  private String gender;
  private String birth;
  private String death;
  private String country;


}
