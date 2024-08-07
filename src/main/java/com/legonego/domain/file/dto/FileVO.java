package com.legonego.domain.file.dto;

import com.legonego.domain.file.entity.FileBoard;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {
    private FileBoard fileBoard;
    private List<FileDTO> fileList;
}
