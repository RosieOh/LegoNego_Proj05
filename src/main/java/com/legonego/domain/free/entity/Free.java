package com.legonego.domain.free.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Free {
    private int fno;
    private String title;
    private String content;
    private String resdate;
    private String visit;
}
