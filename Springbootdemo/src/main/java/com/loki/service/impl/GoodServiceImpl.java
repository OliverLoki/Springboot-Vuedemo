package com.loki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.loki.mapper.GoodMapper;
import com.loki.pojo.Goods;
import com.loki.service.GoodService;
import org.springframework.stereotype.Service;

@Service
public class GoodServiceImpl extends ServiceImpl<GoodMapper, Goods> implements GoodService {
}
