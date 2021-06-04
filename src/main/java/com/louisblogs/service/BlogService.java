package com.louisblogs.service;
/*
 * Created by luqi on 2021/2/14 11:11
 */

import com.louisblogs.po.Blog;
import com.louisblogs.vo.BlogQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface BlogService {

    //查询博客
    Blog getBlog(Long id);

    Blog getAndConVert(Long id);

    //分页查询
    Page<Blog> listBlog(Pageable pageable, BlogQuery blog);

    Page<Blog> listBlog(Pageable pageable);

    Page<Blog> listBlog(Long tagId, Pageable pageable);

    //全局搜索
    Page<Blog> listBlog(String query, Pageable pageable);

    //博客首页展示推荐
    List<Blog> listRecommendBlogTop(Integer size);

    Map<String, List<Blog>> archiveBlog();

    Long countBlog();

    //新增博客
    Blog saveBlog(Blog blog);

    //修改博客
    Blog updateBlog(Long id, Blog blog);

    //删除博客
    void deleteBlog(Long id);

}

