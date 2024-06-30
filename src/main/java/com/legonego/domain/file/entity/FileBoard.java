package com.legonego.domain.file.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileBoard {
    private String id;
    private int postNo;
    private String title;
    private String content;
    private String regdate;
    private int visited;
}
