package com.loki.controller;

import com.loki.pojo.Goods;
import com.loki.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {
    @Autowired
    GoodService goodService;

    @RequestMapping("/test")
    public List<Goods> test() {
        return goodService.list();
    }
}
