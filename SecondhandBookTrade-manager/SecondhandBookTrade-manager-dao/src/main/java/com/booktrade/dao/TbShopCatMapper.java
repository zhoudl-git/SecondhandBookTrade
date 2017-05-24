package com.booktrade.dao;

import com.booktrade.pojo.TbShopCat;
import com.booktrade.pojo.TbShopCatExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TbShopCatMapper {
    int countByExample(TbShopCatExample example);

    int deleteByExample(TbShopCatExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbShopCat record);

    int insertSelective(TbShopCat record);

    List<TbShopCat> selectByExample(TbShopCatExample example);

    TbShopCat selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbShopCat record, @Param("example") TbShopCatExample example);

    int updateByExample(@Param("record") TbShopCat record, @Param("example") TbShopCatExample example);

    int updateByPrimaryKeySelective(TbShopCat record);

    int updateByPrimaryKey(TbShopCat record);
    
    int updateByOtherId(Map<String, Object> map);
    
    int updateShopCatByCatId(Map<String, Object> map);
}