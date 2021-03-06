package com.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.entity.Notice;

import java.util.List;

public interface NoticeService {
    PageInfo<Notice> noticeShow(Integer page, Integer pageSize);//显示所有公告

    boolean publishNotice(Notice notice);//发布公告

    boolean delNotice(Notice notice);

    boolean delmanyNotice(String[] ids);

    boolean editNotice(Notice notice);

    List<Notice> findAll();
}
