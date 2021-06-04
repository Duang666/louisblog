package com.louisblogs.service;
/*
 *Created by luqi on 2021/2/12 22:03
 */

import com.louisblogs.po.Type;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface TypeService {

    //保存分类
    Type saveType(Type type);

    //查询分类
    Type getType(Long id);

    //通过名称查询分类
    Type getTypeByName(String name);

    //分页查询
    Page<Type> listType(Pageable pageable);

    List<Type> listType();

    //博客首页展示分类
    List<Type> listTypeTop(Integer size);

    //修改分类
    Type updateType(Long id, Type type);

    //删除分类
    void deleteType(Long id);

}
