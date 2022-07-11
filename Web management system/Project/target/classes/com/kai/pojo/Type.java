package com.kai.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Type {
    private int id;
    private String type;
    private String style;
    private String subject;
    private String material;
    private String pigment;

}
