package com.louisblogs.interceptor;
/*
 * Created by luqi on 2021/2/13 11:33
 * Web配置类
 */

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        /*配置LoginInterceptor拦截器的拦截路径*/
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/admin/**") //拦截admin下面的所有
                .excludePathPatterns("/admin") //不拦截admin登录页面
                .excludePathPatterns("/admin/login"); //不拦截登录时的post请求页面，否则被拦截无法登录
    }
}
