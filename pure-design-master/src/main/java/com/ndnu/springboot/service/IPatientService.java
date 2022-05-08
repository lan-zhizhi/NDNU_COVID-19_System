package com.ndnu.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ndnu.springboot.entity.Patient;

/**
 * @author LAN
 */
public interface IPatientService extends IService<Patient> {

    /**
     * 获取确诊患者的数据
     * @param objectPage 页面
     * @param category 患者类别
     * @return Patient
     */
    Page<Patient> getPatient(Page<Patient> objectPage, String name, String category);

}
