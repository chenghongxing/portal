package com.cheng.base.service;

import com.cheng.base.domain.Dept;
import com.cheng.base.mapper.DeptMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public List<Dept> getAllDeptList() {
        return deptMapper.selectAllDept();
    }
}
