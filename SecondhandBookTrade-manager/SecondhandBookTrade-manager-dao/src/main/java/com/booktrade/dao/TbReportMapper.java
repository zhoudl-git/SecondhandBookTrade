package com.booktrade.dao;

import com.booktrade.pojo.TbReport;
import com.booktrade.pojo.TbReportExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbReportMapper {
    int countByExample(TbReportExample example);

    int deleteByExample(TbReportExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbReport record);

    int insertSelective(TbReport record);

    List<TbReport> selectByExample(TbReportExample example);

    TbReport selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbReport record, @Param("example") TbReportExample example);

    int updateByExample(@Param("record") TbReport record, @Param("example") TbReportExample example);

    int updateByPrimaryKeySelective(TbReport record);

    int updateByPrimaryKey(TbReport record);
}