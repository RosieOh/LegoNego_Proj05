package com.legonego.domain.file.repository;

import com.legonego.domain.file.dto.FileDTO;
import com.legonego.domain.file.dto.FileVO;
import com.legonego.global.util.Page;

import java.util.List;

public interface FileRepository {
    public void insertFileboard(FileVO fileboard) throws Exception;
    public List<FileVO> getFileList(Page page) throws Exception;
    public List<FileDTO> getFileGroupList(int postNo) throws Exception;
    public FileVO getFilebord(int postNo) throws Exception;
    public FileVO getFileObject(int no) throws Exception;
    public void removeFileboard(int postNo) throws Exception;
    public void editFileboard(FileVO fileboard) throws Exception;
    public void fileRemove(int no) throws Exception;
    public FileDTO getFile(int no) throws Exception;
    public void removeAllFile(int postNo) throws Exception;
    public int totalCount(Page page) throws Exception;
}
