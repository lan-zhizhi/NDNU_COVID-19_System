package com.ndnu.springboot.service;

import com.ndnu.springboot.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author LAN
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> findMenus(String name);
}
