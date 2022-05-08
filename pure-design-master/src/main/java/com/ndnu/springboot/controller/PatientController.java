package com.ndnu.springboot.controller;

import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ndnu.springboot.common.Result;
import com.ndnu.springboot.entity.Patient;
import com.ndnu.springboot.mapper.PatientMapper;
import com.ndnu.springboot.service.IPatientService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author LAN
 */
@RestController
@RequestMapping("/patient")
public class PatientController {

    @Resource
    private IPatientService patientService;

    @GetMapping("/findPage")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam String name,
                           @RequestParam String category) {

        return Result.success(patientService.getPatient(new Page<>(pageNum, pageSize), name, category));
    }

    @PostMapping("/edit")
    public Result editSave(@RequestBody Patient patient){

        patientService.saveOrUpdate(patient);
        return Result.success();
    }

    @DeleteMapping("/del/{id}")
    public Result deletePatient(@PathVariable Integer id){


        return Result.success(patientService.removeById(id));
    }

    /**
     * 导出接口
     */
    @Resource
    private PatientMapper patientMapper;
    @GetMapping("/export/{category}")
    public void export(HttpServletResponse response, @PathVariable String category) throws Exception {
        // 从数据库查询出所有的数据
        QueryWrapper<Patient> queryWrapper = new QueryWrapper<>();
        Map<String,Object> map = new HashMap<>();
        List<Patient> list = null;

        // 通过工具类创建writer 写出到磁盘路径
        // ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("id", "id");
        writer.addHeaderAlias("name", "姓名");
        writer.addHeaderAlias("phone", "电话号码");
        writer.addHeaderAlias("identificationNumber", "身份证号");
        writer.addHeaderAlias("sex", "性别");
        writer.addHeaderAlias("age", "年龄");
        writer.addHeaderAlias("address", "地址");

        String fileName = null;
        switch (category){
            case "diagnose":
                writer.addHeaderAlias("hospitalizationDate", "入院日期");
                writer.addHeaderAlias("infectionSource", "感染来源");
                map.put("category","diagnose");
                list = patientMapper.selectByMap(map);
                fileName = URLEncoder.encode("确诊患者信息", "UTF-8");
                break;

            case "suspected":
                map.put("category","suspected");
                list = patientMapper.selectByMap(map);
                fileName = URLEncoder.encode("疑似患者信息", "UTF-8");
                break;

            case "isolate":
                map.put("category","isolate");
                list = patientMapper.selectByMap(map);
                fileName = URLEncoder.encode("隔离患者信息", "UTF-8");
                break;

            case "death":
                writer.addHeaderAlias("deathDate", "死亡日期");
                map.put("category","death");
                list = patientMapper.selectByMap(map);
                fileName = URLEncoder.encode("死亡患者信息", "UTF-8");
                break;

            case "cure":
                writer.addHeaderAlias("dischargeDate", "治愈日期");
                map.put("category","cure");
                list = patientMapper.selectByMap(map);
                fileName = URLEncoder.encode("治愈患者信息", "UTF-8");
                break;
            default:;
        }

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        if(list!=null){
            writer.write(list, true);
        }

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        if(fileName==null){
            fileName = URLEncoder.encode("患者信息", "UTF-8");
        }

        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();
    }

    /**
     * 批量删除
     * @param ids id数组
     * @return 删除结果
     */
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        return Result.success(patientService.removeByIds(ids));
    }

}
