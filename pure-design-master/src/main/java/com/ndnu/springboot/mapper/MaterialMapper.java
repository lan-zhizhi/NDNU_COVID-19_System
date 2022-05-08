package com.ndnu.springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ndnu.springboot.entity.Material;
import org.apache.ibatis.annotations.Param;


/**
 * @author LAN
 */
public interface MaterialMapper extends BaseMapper<Material> {
    /**
     *按页面返回查找数据
     * @param page 页面参数
     * @return 按页面返回查找数据
     */
    Page<Material> findMaterial(Page<Material> page, @Param("name") String name);
}
