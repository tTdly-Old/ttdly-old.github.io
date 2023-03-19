import Layout from "./Layout.vue";
import "uno.css"
import "./styles/base.css"
import "./styles/vars.css"
import "./styles/fonts.css"
import "./styles/components/vp-doc.css"
import "./styles/components/vp-code.css"
import "./styles/components/custom-block.css"
import "./styles/components/vp-code-group.css"
import "nprogress/nprogress.css";

export default {

  Layout: Layout,
  enhanceApp(ctx) {
    // register your custom global components
    // ctx.app.component('PageList', PageList)
  }
}

