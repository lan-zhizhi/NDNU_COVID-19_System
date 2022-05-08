package com.ndnu.springboot.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ndnu.springboot.entity.Patient;
import com.ndnu.springboot.mapper.PatientMapper;
import com.ndnu.springboot.service.IPatientService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author LAN
 */
@Service
public class PatientServiceImpl extends ServiceImpl<PatientMapper, Patient> implements IPatientService {

    @Resource
    private PatientMapper patientMapper;
    @Override
    public Page<Patient> getPatient(Page<Patient> objectPage, String name, String category) {
        switch (category){
            case "diagnose": return patientMapper.findPatient(objectPage, name);

            case "suspected": return patientMapper.findSuspectedPatient(objectPage, name);

            case "isolate": return patientMapper.findIsolatePatient(objectPage, name);

            case "death": return patientMapper.findDeathPatient(objectPage, name);

            case "cure": return patientMapper.findCurePatient(objectPage, name);
            default:return null;
        }
    }
}
