package com.qingge.springboot.controller.dto;

import lombok.Data;

/**
 * @author LAN
 */
@Data
public class UserPasswordDTO {
    private String account;
    private String password;
    private String newPassword;
}
