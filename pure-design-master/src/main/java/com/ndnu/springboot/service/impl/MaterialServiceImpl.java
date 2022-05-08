package com.ndnu.springboot.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ndnu.springboot.entity.Material;
import com.ndnu.springboot.mapper.MaterialMapper;
import com.ndnu.springboot.service.IMaterialService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author LAN
 */
@Service
public class MaterialServiceImpl extends ServiceImpl<MaterialMapper, Material> implements IMaterialService {

    @Resource
    private MaterialMapper materialMapper;

    @Override
    public Page<Material> getMaterial(Page<Material> objectPage, String name) {
        return materialMapper.findMaterial(objectPage, name);
    }
}
