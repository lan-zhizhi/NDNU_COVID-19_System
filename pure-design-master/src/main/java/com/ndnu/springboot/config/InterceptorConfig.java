package com.ndnu.springboot.config;

import com.ndnu.springboot.config.interceptor.JwtInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**
 *  拦截器配置类
 * @author LAN
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 拦截所有请求，通过判断token是否合法来决定是否需要登录
        registry.addInterceptor(jwtInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/user/login", "/user/register", "/**/export/**", "/**/export","/**/import", "/file/**",
                        "/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html/**", "/api", "/api-docs", "/api-docs/**")
                .excludePathPatterns( "/**/*.html", "/**/*.js", "/**/*.css", "/**/*.woff", "/**/*.ttf");
                // 放行静态文件
    }

    @Bean
    public JwtInterceptor jwtInterceptor() {
        return new JwtInterceptor();
    }

}
