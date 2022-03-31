package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author LAN
 */

@Data
@TableName("meterial")
@ApiModel(value="meterial对象",description="防疫物资的实体类")
public class Meterial {

    @ApiModelProperty("id")
    private Integer id;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("数量")
    private Integer quantity;

    @ApiModelProperty("规格")
    private String specification;

    @ApiModelProperty("来源")
    private String source;

    @ApiModelProperty("备注")
    private String remark;
}
