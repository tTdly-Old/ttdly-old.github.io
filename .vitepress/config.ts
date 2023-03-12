import { themeConfig } from "./theme/config/theme";
import { markdown } from "./theme/config/markdown";
import { defineConfigWithTheme } from "vitepress";

export default defineConfigWithTheme({
  title: ' ',
  description: 'Just playing around.',
  appearance: false,
  titleTemplate: false,
  head:[
    ['link', { rel: 'icon', href: '/logo.svg' }]
  ],
  cacheDir: "../cache",
  outDir: "../dist",
  srcDir: "./pages",
  themeConfig,
  markdown
})
