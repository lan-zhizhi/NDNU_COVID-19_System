<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
<!--      <el-upload :action="'http://' + serverIp + ':9090/user/import'" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">-->
<!--        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>-->
<!--      </el-upload>-->
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="50"></el-table-column>
      <el-table-column prop="name" label="物品名称" ></el-table-column>

      <el-table-column prop="quantity" label="数量" ></el-table-column>
      <el-table-column prop="specification" label="规格" ></el-table-column>
      <el-table-column prop="source" label="来源" ></el-table-column>
      <el-table-column prop="inboundDate" label="最后入库时间"></el-table-column>
      <el-table-column prop="remark" label="备注" ></el-table-column>


      <el-table-column label="操作"  width="170" align="center">
        <template slot-scope="scope">
          <el-button type="primary" @click="lookCourse(scope.row.courses)" v-if="scope.row.role === 'ROLE_TEACHER'">查看教授课程 <i class="el-icon-document"></i></el-button>
          <el-button type="warning" @click="lookStuCourse(scope.row.stuCourses)" v-if="scope.row.role === 'ROLE_STUDENT'">查看已选课程 <i class="el-icon-document"></i></el-button>
          <el-button type="success" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%" >
      <el-form label-width="80px" size="small">
        <el-form-item label="物品名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="form.quantity" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="规格">
          <el-select clearable v-model="form.specification" placeholder="请选择规格" style="width: 100%">
            <el-option v-for="item in specification" :key="item" :label="item" :value="item"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="来源">
          <el-input v-model="form.source" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="入库日期">
          <el-date-picker
              v-model="form.inboundDate"
              type="date"
              placeholder="选择日期"
              format="yyyy 年 MM 月 dd 日"
              value-format="yyyy-MM-dd">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="form.remark" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {serverIp} from "../../public/config";

export default {
  name: "MaterialManagement",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      roles: [],
      specification:["小型","中型","大型"],
      courses: [],
      vis: false,
      stuCourses: [],
      stuVis: false
    }
  },
  created() {
    this.load()
  },
  methods: {
    lookCourse(courses) {
      this.courses = courses
      this.vis = true
    },
    lookStuCourse(stuCourses) {
      this.stuCourses = stuCourses
      this.stuVis = true
    },
    load() {
      this.request.get("/material/findPage", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name:this.name
        }
      }).then(res => {
        console.log(res.data.records)
        this.tableData = res.data.records
        this.total = res.data.total

      })

      this.request.get("/role").then(res => {
        this.roles = res.data
      })
    },
    save() {

      this.request.post("/material/edit", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    del(id) {
      this.request.delete("/material/del/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/user/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.name = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    exp() {
      window.open(`http://${serverIp}:9090/material/export`)
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
