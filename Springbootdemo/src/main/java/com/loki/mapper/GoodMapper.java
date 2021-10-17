package com.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.loki.pojo.Goods;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodMapper extends BaseMapper<Goods> {
}
