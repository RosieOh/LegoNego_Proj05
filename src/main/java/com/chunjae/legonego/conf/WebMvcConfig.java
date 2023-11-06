package com.chunjae.legonego.conf;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {

    // 정적 리소스에 대한 핸들링을 설정하는 메서드
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 모든 경로("/**")를 클래스패스(classpath)의 "/static/" 디렉토리로 매핑
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
        // "/css/" 경로를 클래스패스의 "/static/css/" 디렉토리로 매핑
        registry.addResourceHandler("/css/**").addResourceLocations("classpath:/static/css/");
        // "/js/" 경로를 클래스패스의 "/static/js/" 디렉토리로 매핑
        registry.addResourceHandler("/js/**").addResourceLocations("classpath:/static/js/");
        // "/img/" 경로를 클래스패스의 "/static/img/" 디렉토리로 매핑
        registry.addResourceHandler("/img/**").addResourceLocations("classpath:/static/img/");
        // "/scss/" 경로를 클래스패스의 "/static/scss/" 디렉토리로 매핑
        registry.addResourceHandler("/scss/**").addResourceLocations("classpath:/static/scss/");
        // "/vendor/" 경로를 클래스패스의 "/static/vendor/" 디렉토리로 매핑
        registry.addResourceHandler("/vendor/**").addResourceLocations("classpath:/static/vendor/");
    }
}
