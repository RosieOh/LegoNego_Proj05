package com.chunjae.legonego.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
    private int bno;
    private String catename;
    private String cate;
    private String title;
    private String content;
    private String resdate;
    private int visit;
}
