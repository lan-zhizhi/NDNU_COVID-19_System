<template>
  <div>
    <div class="row">
      <div class="col-lg-3-col-xs-6">
        <div class="small-box-bg-blue">
          <div class="inner">
            <p class="i1">新增无症状感染者人数：</p>
            10029
            <p class="i2">无症状感染者：197213</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3-col-xs-6">
        <div class="small-box-bg-green">
          <div class="inner">
            <p class="i1">新增现有确诊：</p>
            27580
            <p class="i2">现有确诊人数：376625</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3-col-xs-6">
        <div class="small-box-bg-yellow">
          <div class="inner">
            <p class="i1">新增确诊人数: </p>
            30593
            <p class="i2">累计确诊人数：645695</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3-col-xs-6">
        <div class="small-box-bg-red">
          <div class="inner">
            <p class="i1">新增死亡人数：</p>
            59
            <p class="i2">累计死亡人数：15122</p>
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
              </span>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: "dashbord",
      todoList: [
        {
          title: "今天要修复100个bug",
          status: false,
        },
        {
          title: "今天要修复100个bug",
          status: false,
        },
        {
          title: "今天要修复100个bug",
          status: false,
        },
        {
          title: "今天要修复100个bug",
          status: false,
        },
        {
          title: "今天要修复100个bug",
          status: false,
        },
      ]
    }
  }
}
//   name: "dashbord",
//   setup() {
//     const todoList = [
//       {
//         title: "今天要修复100个bug",
//         status: false,
//       },
//     ];
//
//     return {
//       name,
//       todoList,
//     };
//   },
// };
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
  background-color: #ae3ac6;
  display: flex;
  align-items: center;
  color: white;
  border-radius: 5px;
}

.small-box-bg-green {
  width: 230px;
  height: 100px;
  background-color: #e61c1d;
  display: flex;
  align-items: center;
  color: white;
  border-radius: 5px;
}

.small-box-bg-yellow {
  width: 230px;
  height: 100px;
  background-color: #be2121;
  display: flex;
  align-items: center;
  color: white;
  border-radius: 5px;
}

.small-box-bg-red {
  width: 230px;
  height: 100px;
  background-color: #4e5a65;
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
