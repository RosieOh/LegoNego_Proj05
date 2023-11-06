package com.chunjae.test06.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {
    private FileBoard fileBoard;
    private List<FileVO> fileList;
}
