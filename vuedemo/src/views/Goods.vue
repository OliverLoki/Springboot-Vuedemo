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