package com.cheng.base.service;

import com.cheng.base.domain.Dept;
import com.cheng.base.mapper.DeptMapper;
import com.cheng.exception.CustomException;
import com.cheng.login.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/19 17:31
 */
@Service
public class DeptService implements IDeptService {
    private static final Logger logger = LoggerFactory.getLogger(DeptService.class);
    @Autowired
    DeptMapper deptMapper;
    @Override
    public List<Dept> getAllDeptList(Map para) throws CustomException {
        return deptMapper.selectAllDept(para);
    }

    @Override
    public int insertDept(Dept dept) throws CustomException{
        return deptMapper.insertSelective(dept);
    }

    @Override
    public Map<String,Object> selectMaxDeptNo() throws CustomException {
        return deptMapper.getMaxDeptNo();
    }

    @Override
    public Dept getDeptById(Integer deptId) throws CustomException {
        return deptMapper.selectByPrimaryKey(deptId);
    }

    @Override
    public int updateDept(Dept dept) throws CustomException {
        return deptMapper.updateByPrimaryKeySelective(dept);
    }

    @Override
    public int deleteDeptByIds(Integer[] deptIds) throws CustomException {
        return deptMapper.deleteDeptByIds(deptIds);
    }

}
