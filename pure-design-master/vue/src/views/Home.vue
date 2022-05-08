<template>
  <div>
    <div class="row">
      <div class="col-lg-3-col-xs-6">
        <div class="small-box-bg-blue">
          <div class="inner">
            <p class="i1">目前确诊人数：</p>
            0
            <p class="i2">累计确诊人数：0</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3-col-xs-6">
        <div class="small-box-bg-green">
          <div class="inner">
            <p class="i1">目前治愈人数：</p>
            0
            <p class="i2">累计治愈人数：0</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3-col-xs-6">
        <div class="small-box-bg-yellow">
          <div class="inner">
            <p class="i1">目前隔离人数: </p>
            0
            <p class="i2">累计隔离人数：0</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3-col-xs-6">
        <div class="small-box-bg-red">
          <div class="inner">
            <p class="i1">目前死亡人数：</p>
            0
            <p class="i2">累计死亡人数：0</p>
          </div>
        </div>
      </div>
    </div>

    <el-row :gutter="20">
      <el-col :span="8">
        <el-card shadow="hover" style="height:403px;">
          <template #header>
            <div class="clearfix">
              <span>确诊病例过百城市治愈率</span>
            </div>
          </template>
          湖南邵阳市
          <el-progress :percentage="50" color="#00a854"></el-progress>
          浙江杭州市
          <el-progress :percentage="44" color="#00a854"></el-progress>
          河南郑州市
          <el-progress :percentage="43.1" color="#00a854"></el-progress>
          浙江台州市
          <el-progress :percentage="36.6" color="#00a854"></el-progress>
          河南驻马店市
          <el-progress :percentage="36.5" color="#00a854"></el-progress>
          湖南岳阳市
          <el-progress :percentage="32.7" color="#00a854"></el-progress>
          江西南昌市
          <el-progress :percentage="32.4" color="#00a854"></el-progress>
          浙江温州市
          <el-progress :percentage="31.9" color="#00a854"></el-progress>
        </el-card>
      </el-col>

      <el-col :span="16">
        <el-card shadow="hover" style="height:403px; overflow: auto">
          <template #header>
            <div class="clearfix">
              <span>待办事项</span>
              <el-button style="float: right; padding: 3px 0" type="text">添加</el-button>
            </div>
          </template>

          <el-table :show-header="false" :data="todoList" style="width:100%;">
            <el-table-column width="40">
              <template #default="scope">
                <el-checkbox v-model="scope.row.status"></el-checkbox>
              </template>
            </el-table-column>
            <el-table-column>
              <template #default="scope">
                <div class="todo-item" :class="{
                                        'todo-item-del': scope.row.status,
                                    }">{{ scope.row.title }}
                </div>
              </template>
            </el-table-column>
            <el-table-column width="60">
              <span class="editor">
                <img src="../assets/img/edit.png" alt=""/>
                <img src="../assets/img/delete.png" alt=""/>
              </span>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import reactive from "vue";

export default {
  name: "dashboard",
  setup() {
    const name = localStorage.getItem("ms_username");
    const role = name === "admin" ? "超级管理员" : "普通用户";

    const data = reactive([]);
    const options = {};
    const options2 = {};

    const todoList = reactive([
      {
        title: "今天要修复100个bug",
        status: false,
      },
      {
        title: "今天要修复100个bug",
        status: false,
      },
      {
        title: "今天要写100行代码加几个bug",
        status: false,
      },
      {
        title: "今天要修复100个bug",
        status: false,
      },
      {
        title: "今天要修复100个bug",
        status: true,
      },
      {
        title: "今天要写100行代码加几个bug",
        status: true,
      },
    ]);

    return {
      name,
      data,
      options,
      options2,
      todoList,
      role,
    };
  },
};
</script>

<style scoped>

.row {
  margin: 10px;
  display: flex;
  justify-content: space-between;
}

.inner {
  display: inline-block;
  margin-left: 10px;
}

.i2 {
  font-size: small;
}

.col-lg-3-col-xs-6 {
  display: inline-block;
}

.small-box-bg-blue {
  width: 230px;
  height: 100px;
  background-color: #579dff;
  display: flex;
  align-items: center;
  color: white;
  border-radius: 5px;
}

.small-box-bg-green {
  width: 230px;
  height: 100px;
  background-color: #00a854;
  display: flex;
  align-items: center;
  color: white;
  border-radius: 5px;
}

.small-box-bg-yellow {
  width: 230px;
  height: 100px;
  background-color: #ffae35;
  display: flex;
  align-items: center;
  color: white;
  border-radius: 5px;
}

.small-box-bg-red {
  width: 230px;
  height: 100px;
  background-color: #ff503a;
  display: flex;
  align-items: center;
  color: white;
  border-radius: 5px;
}

.editor img {
  width: 20px;
  height: 20px;
}

.user-info-cont div:first-child {
  font-size: 30px;
  color: #222;
}

.user-info-list span {
  margin-left: 70px;
}

.todo-item {
  font-size: 14px;
}

.todo-item-del {
  text-decoration: line-through;
  color: #999;
}
</style>
