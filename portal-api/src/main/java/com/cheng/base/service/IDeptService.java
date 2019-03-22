package com.cheng.base.service;

import com.cheng.base.domain.Dept;
import com.cheng.exception.CustomException;
import java.util.List;
import java.util.Map;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/19 17:30
 */
public interface IDeptService {
     List<Dept> getAllDeptList(Map para) throws CustomException;
     int insertDept(Dept dept) throws CustomException;
    Map<String,Object> selectMaxDeptNo() throws CustomException;
    Dept getDeptById(Integer deptId) throws CustomException;
    int updateDept(Dept dept) throws CustomException;
    int deleteDeptByIds(Integer[] deptIds) throws CustomException;
}
