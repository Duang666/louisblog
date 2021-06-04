package com.louisblogs.dao;
/*
 * Created by luqi on 2021/2/14 11:19
 */

import com.louisblogs.po.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BlogRepository extends JpaRepository<Blog, Long>, JpaSpecificationExecutor<Blog> {

    Blog getBlogById(Long id);

    /*查询推荐博客展示在首页最新推荐模块*/
    @Query("select b from t_blog b where b.recommend = true ")
    List<Blog> findTop(Pageable pageable);

    // select * from t_blog where title like '%内容 %'
    @Query("select b from t_blog b where b.published=true and b in(select b from t_blog b where b.title like ?1 or b.description like ?1)")
    Page<Blog> findByQuery(String query, Pageable pageable);

    @Transactional
    @Modifying
    @Query("update t_blog b set b.views = b.views+1 where b.id = ?1")
    int updateViews(Long id);

    /*在归档模块展示博客*/
    /*获取博客年份并显示年份*/
    @Query("select function('date_format',b.updateTime,'%Y') as year from t_blog b group by function('date_format',b.updateTime,'%Y') order by function('date_format',b.updateTime,'%Y') desc ")
    List<String> findGroupYear();
    /*将博客按年份分组*/
    @Query("select b from t_blog b where function('date_format',b.updateTime,'%Y') = ?1 and b.published=true")
    List<Blog> findByYear(String year);
}
