package com.chunjae.legonego.entity;

import lombok.Data;

@Data
public class Board {
    private int bno;
    private String title;
    private String content;
    private String resdate;
    private int visit;
    private int count;
}
