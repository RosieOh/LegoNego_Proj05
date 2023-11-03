package com.chunjae.legonego.entity;

import lombok.Data;

@Data
public class BoardComment {
    private int cno;
    private int bno;
    private String content;
    private String resdate;
    private String author;
    private String name;
}
