package com.ndnu.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ndnu.springboot.controller.dto.UserDTO;
import com.ndnu.springboot.controller.dto.UserPasswordDTO;
import com.ndnu.springboot.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author LAN
 */
public interface IUserService extends IService<User> {

    /**
     * 登录
     * @param userDTO 接受前端登录请求的参数的对象
     * @return UserDTo
     */
    UserDTO login(UserDTO userDTO);


    void updatePassword(UserPasswordDTO userPasswordDTO);

    Page<User> findPage(Page<User> objectPage, String account);
}
