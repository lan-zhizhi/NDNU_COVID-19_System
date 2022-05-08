package com.ndnu.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ndnu.springboot.controller.dto.UserPasswordDTO;
import com.ndnu.springboot.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author LAN
 * @since 2022-04-01
 */
public interface UserMapper extends BaseMapper<User> {

    /**
     * 用户更新密码方法
     * @param userPasswordDTO 用户密码对象
     * @return 无返回值
     */
    @Update("update sys_user set password = #{newPassword} where account = #{account} and password = #{password}")
    int updatePassword(UserPasswordDTO userPasswordDTO);


    Page<User> findPage(Page<User> page, @Param("account") String account);
}
