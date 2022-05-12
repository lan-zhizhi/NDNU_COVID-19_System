package com.ndnu.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * <p>
 *
 * </p>
 *
 * @author LAN
 * @since 2022-03-31
 */
@Getter
@Setter
@TableName("sys_user")
@ApiModel(value = "User对象", description = "用户实体类")
@ToString
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户名")
    private String account;

    @ApiModelProperty("密码")
    private String password;

    @ApiModelProperty("姓名")
    private String username;

    @ApiModelProperty("电话")
    private String phone;

    @ApiModelProperty("部门")
    private String department;

    @ApiModelProperty("创建时间")
    private String createTime;

    @ApiModelProperty("头像")
    private String avatarUrl;

    @ApiModelProperty("角色")
    private String role;

}
