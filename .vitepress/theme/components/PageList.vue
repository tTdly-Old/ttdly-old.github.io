<template>
  <template v-for="(info, index) in pageList" :key="index">
    <ul>
      <span class="page-year">{{ info[0] }}</span>
      <template v-for="({file, data}, index) in info[1]" :key="index">
        <a :href="file">
          <li class="list-item">
            <div class="title">{{ data.title }}</div>
            <div class="info">{{ `${data.date.getMonth()+1}月${data.date.getDate()}日` }},<span style="margin-left: 0.5rem;"></span>{{ data.word }}字</div>
          </li>
        </a>
      </template>
    </ul>
  </template>
</template>


<script setup>
import { data } from "../utils/pages.data.ts"
import fakedata from "../utils/fakedata.ts"
let pages; //存储文章列表
// 判断当前环境，确认使用哪些数据
if (process.env.NODE_ENV === "development") {
  pages = fakedata.pageList;
} else {
  pages = data.data;
}
// 对数据进行处理
const getPageList = (pages) => {
  const temp = new Map();
  const list = new Array();
  const listMap = new Map();
  pages.forEach(element => {
    let arr;
    let date = new Date(element.data.date);
    element.data.date = date;
    arr = temp.get(date.getFullYear());
    if (typeof arr === 'undefined') arr = new Array();
    arr.push(element);
    temp.set(date.getFullYear(), arr);
  });
  for (const i of temp.keys()) {
    list.push(i);
  }
  list.sort((a, b)=> b - a);
  for (const i of list) {
    let obj = temp.get(i);
    obj.sort((a, b) => {
      return a.data.date - b.data.date;
    });
    listMap.set(i, obj);
  }
  return listMap;
}
const pageList = getPageList(pages);
</script>


<style scoped lang="scss">
ul {
  padding: 0;
  margin: 0;
  padding-bottom: 1rem;
}

.list-item {
  list-style: none;
  border-bottom: 1px solid transparent;
  transition: border-color .25s;
  margin: 1.5rem 0;
  margin-left: 1rem;
  &:hover {
    border-color: var(--vp-c-text-1);
  }
}

.title {
  color: var(--vp-c-text-1);
  font-size: var(--dlyu-title-size);
  line-height: var(--dlyu-title-size);
  font-size: 1.5rem;
  font-weight: normal;
}

.info {
  margin-top: 2px;
  font-size: 1rem;
  font-weight: 300;
  color: var(--vp-c-text-3);
}
.page-year{
  display: block;
  margin-bottom: 1rem;
  padding: 6px 4px;
  font-weight: bold;
  background: var(--vp-c-text-3);
  border-left: 6px solid var(--vp-c-text-1);
}
</style>