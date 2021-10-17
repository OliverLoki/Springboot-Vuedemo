本项目旨在快速搭建一个基于Vue2.X+Springboot的前后端分离的项目，使前端界面展示数据库数据

## 环境与开发工具

+ Node.js   
+ Jdk 11
+ IDEA--开发工具
+ Springboot    v2.5.5
+ mybatis-plus 3.4.2(对mybatis只做增强不做改变，便于简单查询)

## Springboot后端接口开发

IDEA中新建一个Springboot应用，从数据库中查询数据并返回，保证Springboot应用正常运行，即为搭建成功

**项目结构**

![image-20211016175042189](https://i.loli.net/2021/10/17/CFnbyQ5sEYf9Jpi.png)

`pom.xml`相关依赖

```xml
<dependencies>
        <!--web启动器-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <!--Lombok-->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        <!--mysql驱动-->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
        </dependency>
        <!--mybatis-plus-->
        <dependency>
            <groupId>com.baomidou</groupId>
            <artifactId>mybatis-plus-boot-starter</artifactId>
            <version>3.4.2</version>
        </dependency>
    </dependencies>
```

`Goods`商品实体类

```
@AllArgsConstructor
@NoArgsConstructor
@Data
@TableName("goods")
public class Goods {
    private int id;
    private String price;
    private String name;
}

```

`GoodMapper`

```java
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.loki.pojo.Goods;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface GoodMapper extends BaseMapper<Goods> {
}
```

`GoodService`

```java
import com.baomidou.mybatisplus.extension.service.IService;
import com.loki.pojo.Goods;

public interface GoodService extends IService<Goods> {
}
```

`GoodServiceImpl`

```java
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.loki.mapper.GoodMapper;
import com.loki.pojo.Goods;
import com.loki.service.GoodService;
import org.springframework.stereotype.Service;

@Service
public class GoodServiceImpl extends ServiceImpl<GoodMapper, Goods> implements GoodService {
}
```

`TestController`

```java
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

```

**访问localhost:9090/test，成功返回一个Json字符串，至此，后端模块开发完成**

![image-20211016175941480](https://i.loli.net/2021/10/16/NYdAlRcKnxtL61V.png)

## vue前端界面开发

### Vue的安装

> 首先确保本机有Node.js的环境，否则无法通过以下命令行方式安装

**以管理员身份运行命令行（Win+R 输入cmd），输入以下命令** 

```
npm install @vue/cli -g  //默认安装Vue3最新版本，这里vue3是兼容vue2的所有东西的
```

**验证是否安装成功**

```
vue -V //运行该命令，出现对应版本号，则安装成功
```

![](https://i.loli.net/2021/10/16/WJONQ9jTiAywo6H.png)

### 创建一个Vue项目

> vue ui是@vue/cli3.0增加一个可视化项目管理工具，可以运行项目、打包项目，检查等操作。对于初学者来说，可以少记一些命令

新建一个文件夹，在该文件夹下执行

```bash
vue ui
```

![image-20211017183456775](https://i.loli.net/2021/10/17/JIAQPNES9XCgfnL.png)

![](https://s3.bmp.ovh/imgs/2021/10/e28997f6eadff11f.png)

点击创建新项目

![image-20211017183918155](https://i.loli.net/2021/10/17/BFxw4JCX8rnkled.png)

点击下一步，**选择手动配置项目**

![](https://s3.bmp.ovh/imgs/2021/10/0da42d2592da2976.png)

勾选红框内的选项卡，点击下一步，**选择Vue版本为2.x**

![image-20211017184232510](https://i.loli.net/2021/10/17/RaoBkfc38zrliA1.png)

选择创建项目，但不保存预设，至此，一个干净的Vue项目就生成了

在项目跟目录下运行，并访问端口，测试是否创建成功

```
npm run serve
```

至此，所有依赖加载完毕，我们可以来写代码了





### 准备工作

创建项目成功后，我们使用idea工具来进行开发，使用idea打开项目的根目录文件夹

idea需要安装第三方插件所以来编辑我们的vue程序，因此，我们需要一个插件 `vue.js`,去插件市场安装即可

![image-20211017185010942](https://i.loli.net/2021/10/17/C9nz763dWu8GyLs.png)

**idea自带命令行终端**，操作方式与命令行相同

![](https://s3.bmp.ovh/imgs/2021/10/a8303c10dd4c3c6b.png)

### 安装Element UI

1、**切换到项目根目录**，使用npm安装element-ui依赖

```
npm install element-ui 
```

![image-20211017190022386](https://i.loli.net/2021/10/17/BNbUeiWRkcHxzdr.png)

2、在项目src目录下的`main.js`，引入element-ui依赖

```
import Element from 'element-ui'
import "element-ui/lib/theme-chalk/index.css"
Vue.use(Element)
```

### 安装Axios

> Axios是一个基于 promise 的 HTTP 库，这样我们进行前后端对接的时候，使用这个工具可以提高我们的开发效率



1、**切换到项目根目录**，使用npm安装Axios依赖

```
npm install axios
```

2、在项目src目录下的`main.js`，引入element-ui依赖

```
import axios from 'axios'
Vue.prototype.$axios = axios 
```

`Vue.prototype.$axios = axios `

**这行代码在main.js里面将axios 挂载到了vue的原型上，相当于一次全局安装，需要使用的时候直接this.$axios就行

至此，所有前端环境准备完成，我们开始编写代码

**项目结构**

![image-20211017232137792](https://i.loli.net/2021/10/17/napFwjMt9GlEcUr.png)

`router/index.js`

```js
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    component:()=>import('../views/Goods')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
```

`views/Goods.view`

```vue
<template>
    <div>
        <template>
            <el-table
                    :data="tableData"
                    border
                    style="width: 100%">
                <el-table-column
                        prop="id"
                        label="编号"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="name"
                        label="姓名"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="price"
                        label="价格">
                </el-table-column>
            </el-table>
        </template>
    </div>

</template>

<script>
    export default {
        data() {
            return {
                tableData: [{/*测试数据*/
                    id: '2016-05-03',
                    name: '王小虎',
                    price: '上海市普陀区金沙江路 1518 弄'
                }]
            }
        },
        created() {/*界面初始化操作，界面加载之前执行*/
            const _this = this/*该this是vue全局的this，防止了函数中写this是方法的this*/
            this.$axios.get('http://localhost:8090/test').then(function (resp) {
                _this.tableData = resp.data;

            })
        }
    }
</script>
<style scoped>
</style>
```

`App.vue`

```
<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style>

</style>
```

`main.js`

```
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
/*引入element-UI的依赖*/
import Element from 'element-ui'
import "element-ui/lib/theme-chalk/index.css"
/*引入axios*/
import axios from 'axios'

/*全局使用*/
Vue.use(Element)
Vue.prototype.$axios = axios

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
```



## 解决访问后端数据时产生的跨域问题

 Java中新建config包，编写`CorsConfig`类

```
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class CorsConfig {
    private CorsConfiguration buildConfig() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.addAllowedOrigin("*"); // 1允许任何域名使用
        corsConfiguration.addAllowedHeader("*"); // 2允许任何头
        corsConfiguration.addAllowedMethod("*"); // 3允许任何方法（post、get等）
        return corsConfiguration;
    }

    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", buildConfig()); // 4
        return new CorsFilter(source);
    }
}
```

## 运行结果

运行前端界面，可以看到从数据库中查到了数据并返回到

![image-20211017232537681](https://i.loli.net/2021/10/17/GYN6QBCTcUIkasp.png)



