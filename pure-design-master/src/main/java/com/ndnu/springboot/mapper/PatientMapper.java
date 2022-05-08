package com.ndnu.springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ndnu.springboot.entity.Patient;
import org.apache.ibatis.annotations.Param;

/**
 * @author LAN
 */
public interface PatientMapper extends BaseMapper<Patient> {
    /**
     *查询确诊患者的数据
     * @param page 页面参数
     * @param name
     *
     * @return patient list
     */
    Page<Patient> findPatient(Page<Patient> page, @Param("name") String name);

    /**
     * 查询疑似患者数据
     * @param page 页面参数
     * @return patient list
     */
    Page<Patient> findSuspectedPatient(Page<Patient> page, @Param("name") String name);

    /**
     *查询隔离患者的数据
     * @param page 页面参数
     * @return patient list
     */
    Page<Patient> findIsolatePatient(Page<Patient> page, @Param("name") String name);

    /**
     *查询死亡患者的数据
     * @param page 页面参数
     * @return patient list
     */
    Page<Patient> findDeathPatient(Page<Patient> page, @Param("name") String name);


    /**
     *查询治愈患者的数据
     * @param page 页面参数
     * @return patient list
     */
    Page<Patient> findCurePatient(Page<Patient> page, @Param("name") String name);
}
