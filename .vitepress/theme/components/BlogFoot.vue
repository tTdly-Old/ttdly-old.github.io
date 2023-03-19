<template>
  <div class="BlogFoot">
    <div v-if=" typeof frontmatter.page === 'undefined'" class="neighbor-container">
      <a href="javascript:history.back(-1)">&gt; cd ..</a><br>
<!--      <a v-show="neighbor.prev" :href="neighbor.prev.url">cat {{ neighbor.prev.frontmatter.title }}.md</a><br>-->
<!--      <a v-show="neighbor.next" :href="neighbor.next.url">cat {{ neighbor.next.frontmatter.title }}.md</a>-->
    </div>
    <div class="licences">
      <a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">
        CC 4.0 BY-NC-SA
      </a>

      <span class="license-info">{{ yearInfo }}<a href="https://github.com/ttdly" target="_blank">@秃头灯笼鱼</a></span>
    </div>
  </div>
</template>

<script setup>
import { useRoute, useData } from 'vitepress';
import { computed } from "vue";

const startYear = 2023;
const { frontmatter } = useData();
const nowYear = new Date().getFullYear();
const neighbor = computed(()=>{
  const index = Number.parseInt( localStorage.getItem("index") ),
        posts = JSON.parse( localStorage.getItem("posts") );
  console.log(posts)
  return {
    prev: (typeof posts[index - 1] === 'undefined') ? false : posts[index - 1],
    next: (typeof posts[index + 1] === 'undefined') ? false : posts[index + 1]
  }
})

// 版权时间信息
let yearInfo = "";
if ( nowYear > startYear) {
  yearInfo = `${startYear}-${nowYear}`;
} else {
  yearInfo = `${startYear}`;
}

// 上一篇下一篇
</script>
<style>
.neighbor-container{
  margin: 3rem 0;
}

</style>