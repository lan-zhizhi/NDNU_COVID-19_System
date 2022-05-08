package com.ndnu.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ndnu.springboot.entity.Material;

/**
 * @author LAN
 */
public interface IMaterialService extends IService<Material> {

    /**
     *获取物资信息
     * @param objectPage 页面参数
     * @return 物资数据
     */
    Page<Material> getMaterial(Page<Material> objectPage, String name);
}
