<script>
import marked from "~/utils/markdown-renderer";

/**
 *  In order to be able to render a Vue component inside marked() a dynamic component has to be used.
 *  See: https://codepen.io/movii/pen/bRgGgJ?editors=1011 and https://forum.vuejs.org/t/dynamically-compile-router-link/7410/10
 */
export default {
  name: "RichContent",
  props: ["content"],
  template: `<component :is="transformed"></component>`,
  computed: {
    transformed() {
      return {
        name: "MarkdownTransformer",
        template: `<div class="prose prose-lg">${marked(this.content)}</div>`,
      };
    },
  },
};
</script>
