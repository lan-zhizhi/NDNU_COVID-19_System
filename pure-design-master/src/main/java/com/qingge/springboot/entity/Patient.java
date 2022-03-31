package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author LAN
 */
@Data
@TableName("patient")
@ApiModel(value= "Patient对象",description="患者实体类" )
public class Patient {

    @ApiModelProperty("id")
    @TableId(value="id", type=IdType.AUTO)
    private Integer id;

    @ApiModelProperty("姓名")
    private String name;

    @ApiModelProperty("身份证号")
    private String identificationNumber;

    @ApiModelProperty("性别")
    private char sex;

    @ApiModelProperty("年龄")
    private Integer age;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("入院日期")
    private Date hospitalizationDate;

    @ApiModelProperty("感染来源")
    private String infectionSource;

    @ApiModelProperty("死亡日期")
    private Date deathDate;

    @ApiModelProperty("治愈日期")
    private Date dischargeDate;

    @ApiModelProperty("患者类别（确诊，疑似，治愈，死亡）")
    private String category;

}
