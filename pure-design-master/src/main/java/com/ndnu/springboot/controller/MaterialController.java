package com.ndnu.springboot.controller;

import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ndnu.springboot.common.Result;
import com.ndnu.springboot.entity.Material;
import com.ndnu.springboot.service.IMaterialService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.List;

/**
 * @author LAN
 */
@RestController
@RequestMapping("/material")
public class MaterialController {

    @Resource
    private IMaterialService materialService;

    @GetMapping("/findPage")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam String name){

        return Result.success(materialService.getMaterial(new Page<>(pageNum, pageSize), name));
    }

    @DeleteMapping("/del/{id}")
    public Result deleteMaterial(@PathVariable Integer id){


        return Result.success(materialService.removeById(id));
    }

    @PostMapping("/edit")
    public Result editSave(@RequestBody Material material){

        materialService.saveOrUpdate(material);
        return Result.success();
    }

    /**
     * 导出接口
     */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Material> list = materialService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("id", "id");
        writer.addHeaderAlias("name", "名称");
        writer.addHeaderAlias("quantity", "数量");
        writer.addHeaderAlias("specification", "规格");
        writer.addHeaderAlias("inboundDate", "最后入库时间");
        writer.addHeaderAlias("source", "来源");
        writer.addHeaderAlias("remark", "备注");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("防疫物资信息", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }
}
