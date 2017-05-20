package com.booktrade.dao;

import com.booktrade.pojo.TbFunction;
import com.booktrade.pojo.TbFunctionExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TbFunctionMapper {
    int countByExample(TbFunctionExample example);

    int deleteByExample(TbFunctionExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbFunction record);

    int insertSelective(TbFunction record);

    List<TbFunction> selectByExample(TbFunctionExample example);

    TbFunction selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbFunction record, @Param("example") TbFunctionExample example);

    int updateByExample(@Param("record") TbFunction record, @Param("example") TbFunctionExample example);

    int updateByPrimaryKeySelective(TbFunction record);

    int updateByPrimaryKey(TbFunction record);
    List<TbFunction> getAllMenu2(Long userId);
    int updateTreeNode(Map<String, Object> map);
}