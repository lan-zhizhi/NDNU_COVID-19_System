package com.ndnu.springboot.controller.dto;

import com.ndnu.springboot.entity.Menu;
import lombok.Data;

import java.util.List;

/**
 * 接受前端登录请求的参数
 * @author LAN
 */
@Data
public class UserDTO {
    private Integer id;
    private String account;
    private String password;
    private String username;
    private String avatarUrl;
    private String token;
    private String role;
    private List<Menu> menus;
}
