<template>
  <Layout>
    <template #doc-before>
      <img class="content-img" v-if="top.image" :src="top.image" alt="" />
      <div class="title" v-if="top.title">{{ top.title }}</div>
      <div class="info" v-if="top.date">{{ top.date }}<span>.</span>
        <template v-if="top.tags" v-for="tag in top.tags">
          <span :class="``">{{ tag }},</span>
        </template>
      </div>
      
    </template>
    <template #doc-after>
      <div class="footer">
        <a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">
          CC 4.0 BY-NC-SA
        </a>
        <!-- <a class="i-logos-rust" href="http://vitepress.vuejs.org" target="_blank"></a> -->
        <span class="license-info">2023 <a href="https://github.com/ttdly" target="_blank">@秃头灯笼鱼</a></span>
      </div>
    </template>
  </Layout>
</template>

<script setup>
// TODO版权信息
import DefaultTheme from 'vitepress/theme';
import { useData } from 'vitepress';
import { computed } from 'vue';

const { frontmatter } = useData(); // 获取到头部配置文件
const { Layout } = DefaultTheme; // 获取默认布局

const top = computed(()=>{
  const fron = frontmatter.value;
  return{
    image: (typeof fron.image === 'undefined')? false : fron.image,
    title: (typeof fron.title === 'undefined')? false : fron.title,
    date: (typeof fron.date === 'undefined')? false : fron.date,
    tags: (typeof fron.tags === 'undefined')? false : fron.tags,
  }
});
</script>

<style scoped lang="scss">
.content-img {
  object-fit: cover;
  object-position: center;
  display: block;
  height: 16rem;
  width: 100%;
  margin-bottom: var(--dlyu-title-size);
}

.title {
  color: var(--vp-c-text-1);
  font-size: var(--dlyu-title-size);
  font-weight: 600;
  line-height: var(--dlyu-title-size);
  margin-bottom: var(--dlyu-title-size);
}

/* 头部标题下时间以及字数信息 */
.info {
  margin-bottom: var(--dlyu-title-size);
  color: var(--vp-c-text-3);
  display: flex;
  align-items: center;
}

.info>span {
  margin-right: 0.2em;
}

/* 尾部信息 */
.footer {
  display: flex;
  align-items: center;
  justify-content: start;
  color: var(--vp-c-text-3);
  margin: var(--dlyu-title-size) 0;
}

[rel="license"] {
  width: fit-content;
}
[class^="i-"]{
  filter: grayscale(100%);
  transition: .5s;
  margin: 0 4px;
  vertical-align: sub;
  &:hover{
    filter: grayscale(0);
  }
}
// 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

.neon-border {
  $neon-width: 0px;
  border: 1px solid;
  border-color: white;
  position: relative;
  img{
    opacity: 0.8;
  }
  &::after{
    content: "";
    position: absolute;
    top: $neon-width;
    bottom: $neon-width;
    right: $neon-width;
    left: $neon-width;
    background: #592ed6;
    z-index: -1;
    // filter: blur(2px);
    transition: .3s;
    animation: neon-border-ani 6s alternate infinite;
  }
}

.license-info {
  margin-left: .5em;
}


@keyframes neon-border-ani {
  0% {
    background: red;
  }

  20% {
    background:blueviolet
  }

  40% {
    background: green;
  }

  60% {
    background: blue;
  }

  80% {
    background: purple;
  }

  100% {
    background: red;
  }
}
</style>