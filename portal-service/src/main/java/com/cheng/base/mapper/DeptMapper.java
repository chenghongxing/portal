package com.cheng.base.mapper;

import com.cheng.base.domain.Dept;

import java.util.List;
import java.util.Map;

public interface DeptMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Integer deptId);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);

    List<Dept> selectAllDept(Map para);

    Map<String,Object> getMaxDeptNo();

    int deleteDeptByIds(Integer[] deptIds);
}