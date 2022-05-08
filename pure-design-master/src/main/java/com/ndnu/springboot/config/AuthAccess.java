package com.ndnu.springboot.config;

import java.lang.annotation.*;

/**
 * @author LAN
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AuthAccess {

}
