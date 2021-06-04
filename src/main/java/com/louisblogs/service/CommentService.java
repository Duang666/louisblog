package com.louisblogs.service;
/*
 * Created by luqi on 2021/2/18 16:43
 */

import com.louisblogs.po.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> listCommentByBlogId(Long blogId);

    Comment saveComment(Comment comment);

}
