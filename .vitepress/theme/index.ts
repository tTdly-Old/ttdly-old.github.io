// .vitepress/theme/index.js
import DefaultTheme from 'vitepress/theme';
import Layout from "./Layout.vue";
// import PageList from "./components/PageList.vue";
import './scss/index.scss'


export default {
  ...DefaultTheme,
  Layout: Layout,
  enhanceApp(ctx) {
    // register your custom global components
    // ctx.app.component('PageList', PageList)
  }
}

