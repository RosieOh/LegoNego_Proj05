package com.chunjae.legonego.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
    private int no;
    private String title;
    private String content;
    private String resdate;
    private int visit;
}
