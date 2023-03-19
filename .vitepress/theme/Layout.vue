<script setup>
import { useData } from 'vitepress'
import Blog from './components/Blog.vue';
import {onBeforeUpdate, onUpdated} from "vue";
import Nprogress from 'nprogress';

const { page } = useData();
onBeforeUpdate(()=>{
  Nprogress.start();
});
onUpdated(()=>{
  Nprogress.done();
})
</script>

<template>
  <div v-if="page.isNotFound">
    404
  </div>

  <Blog v-else />
</template>
