package com.chunjae.test06.entity;

import lombok.Data;

@Data
public class Book {
    @Id
    private Long seq;
    @NotBlank(message="제목을 반드시 입력하시기 바랍니다.")
    private String title;
    @NotBlank(message="저자를 반드시 입력하시기 바랍니다.")
    private String creator;
    @NotNull
    @Size(min=2, message="출판사는 두 글자 이상 입력하여야 합니다.")
    private String publisher;
    private String pubDate;
    private String seller;
    private int amount;
    private int oriPrice;
    private int viewCnt;
    private String states;
    private String img;
}