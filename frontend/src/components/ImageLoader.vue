<template>
  <img
    src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjwhLS0gR2VuZXJhdGVkIGJ5IEljb01vb24uaW8gLS0+Cgo8c3ZnCiAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgeG1sbnM6Y2M9Imh0dHA6Ly9jcmVhdGl2ZWNvbW1vbnMub3JnL25zIyIKICAgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIgogICB4bWxuczpzdmc9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIgogICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCiAgIHhtbG5zOnNvZGlwb2RpPSJodHRwOi8vc29kaXBvZGkuc291cmNlZm9yZ2UubmV0L0RURC9zb2RpcG9kaS0wLmR0ZCIKICAgeG1sbnM6aW5rc2NhcGU9Imh0dHA6Ly93d3cuaW5rc2NhcGUub3JnL25hbWVzcGFjZXMvaW5rc2NhcGUiCiAgIHZlcnNpb249IjEuMSIKICAgd2lkdGg9IjUxMiIKICAgaGVpZ2h0PSI0NDgiCiAgIHZpZXdCb3g9IjAgMCA1MTIgNDQ4IgogICBpZD0ic3ZnMTEiCiAgIHNvZGlwb2RpOmRvY25hbWU9ImltYWdlLXBsYWNlaG9sZGVyLnN2ZyIKICAgaW5rc2NhcGU6dmVyc2lvbj0iMC45Mi4zICgyNDA1NTQ2LCAyMDE4LTAzLTExKSI+CiAgPG1ldGFkYXRhCiAgICAgaWQ9Im1ldGFkYXRhMTciPgogICAgPHJkZjpSREY+CiAgICAgIDxjYzpXb3JrCiAgICAgICAgIHJkZjphYm91dD0iIj4KICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3N2Zyt4bWw8L2RjOmZvcm1hdD4KICAgICAgICA8ZGM6dHlwZQogICAgICAgICAgIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiIC8+CiAgICAgICAgPGRjOnRpdGxlIC8+CiAgICAgIDwvY2M6V29yaz4KICAgIDwvcmRmOlJERj4KICA8L21ldGFkYXRhPgogIDxkZWZzCiAgICAgaWQ9ImRlZnMxNSIgLz4KICA8c29kaXBvZGk6bmFtZWR2aWV3CiAgICAgcGFnZWNvbG9yPSIjZmZmZmZmIgogICAgIGJvcmRlcmNvbG9yPSIjNjY2NjY2IgogICAgIGJvcmRlcm9wYWNpdHk9IjEiCiAgICAgb2JqZWN0dG9sZXJhbmNlPSIxMCIKICAgICBncmlkdG9sZXJhbmNlPSIxMCIKICAgICBndWlkZXRvbGVyYW5jZT0iMTAiCiAgICAgaW5rc2NhcGU6cGFnZW9wYWNpdHk9IjAiCiAgICAgaW5rc2NhcGU6cGFnZXNoYWRvdz0iMiIKICAgICBpbmtzY2FwZTp3aW5kb3ctd2lkdGg9IjE5MjAiCiAgICAgaW5rc2NhcGU6d2luZG93LWhlaWdodD0iMTAyNSIKICAgICBpZD0ibmFtZWR2aWV3MTMiCiAgICAgc2hvd2dyaWQ9ImZhbHNlIgogICAgIGZpdC1tYXJnaW4tdG9wPSIwIgogICAgIGZpdC1tYXJnaW4tbGVmdD0iMCIKICAgICBmaXQtbWFyZ2luLXJpZ2h0PSIwIgogICAgIGZpdC1tYXJnaW4tYm90dG9tPSIwIgogICAgIGlua3NjYXBlOnpvb209IjAuNjUxODY0MDYiCiAgICAgaW5rc2NhcGU6Y3g9Ii0xMTAuNjg1NDciCiAgICAgaW5rc2NhcGU6Y3k9IjI3NS4wODIwNiIKICAgICBpbmtzY2FwZTp3aW5kb3cteD0iMCIKICAgICBpbmtzY2FwZTp3aW5kb3cteT0iMjciCiAgICAgaW5rc2NhcGU6d2luZG93LW1heGltaXplZD0iMSIKICAgICBpbmtzY2FwZTpjdXJyZW50LWxheWVyPSJzdmcxMSIgLz4KICA8ZwogICAgIGlkPSJpY29tb29uLWlnbm9yZSIKICAgICB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLC0zMikiIC8+CiAgPHBhdGgKICAgICBkPSJtIDQ3OS45NDIsMzIgYyAwLjAyLDAuMDE3IDAuMDQxLDAuMDM4IDAuMDU4LDAuMDU4IHYgMzgzLjg4NSBjIC0wLjAxNywwLjAyIC0wLjAzOCwwLjA0MSAtMC4wNTgsMC4wNTggSCAzMi4wNTcgQyAzMi4wMzcsNDE1Ljk4NCAzMi4wMTYsNDE1Ljk2MyAzMiw0MTUuOTQzIFYgMzIuMDU3IEMgMzIuMDE3LDMyLjAzNyAzMi4wMzgsMzIuMDE2IDMyLjA1NywzMiBaIE0gNDgwLDAgSCAzMiBDIDE0LjQsMCAwLDE0LjQgMCwzMiB2IDM4NCBjIDAsMTcuNiAxNC40LDMyIDMyLDMyIGggNDQ4IGMgMTcuNiwwIDMyLC0xNC40IDMyLC0zMiBWIDMyIEMgNTEyLDE0LjQgNDk3LjYsMCA0ODAsMCBaIgogICAgIGlkPSJwYXRoNSIKICAgICBzdHlsZT0ic3Ryb2tlLXdpZHRoOjAuMjtzdHJva2UtbWl0ZXJsaW1pdDo0O3N0cm9rZS1kYXNoYXJyYXk6bm9uZTtmaWxsOiNlYmViZWI7ZmlsbC1vcGFjaXR5OjEiCiAgICAgaW5rc2NhcGU6Y29ubmVjdG9yLWN1cnZhdHVyZT0iMCIgLz4KICA8cGF0aAogICAgIGQ9Im0gNDE2LDExMiBjIDAsMjYuNTEgLTIxLjQ5LDQ4IC00OCw0OCAtMjYuNTEsMCAtNDgsLTIxLjQ5IC00OCwtNDggMCwtMjYuNTEgMjEuNDksLTQ4IDQ4LC00OCAyNi41MSwwIDQ4LDIxLjQ5IDQ4LDQ4IHoiCiAgICAgaWQ9InBhdGg3IgogICAgIGlua3NjYXBlOmNvbm5lY3Rvci1jdXJ2YXR1cmU9IjAiCiAgICAgc3R5bGU9ImZpbGw6I2ViZWJlYjtmaWxsLW9wYWNpdHk6MSIgLz4KICA8cGF0aAogICAgIGQ9Ik0gNDQ4LDM4NCBIIDY0IFYgMzIwIEwgMTc2LDEyOCAzMDQsMjg4IGggMzIgbCAxMTIsLTk2IHoiCiAgICAgaWQ9InBhdGg5IgogICAgIGlua3NjYXBlOmNvbm5lY3Rvci1jdXJ2YXR1cmU9IjAiCiAgICAgc3R5bGU9ImZpbGw6I2ViZWJlYjtmaWxsLW9wYWNpdHk6MSIgLz4KICA8c3R5bGUKICAgICBpZD0ic3R5bGUzIgogICAgIHR5cGU9InRleHQvY3NzIj4KCS5zdDB7ZmlsbDojRDQwNTExO30KPC9zdHlsZT4KPC9zdmc+Cg=="
    :alt="image.alt"
    :width="image.size.width"
    :data-srcset="image.srcset"
    :data-sizes="image.sizes"
    :data-src="image.src"
    ref="image"
  />
</template>

<script>
import getUrl from "~/utils/url-resolver";

export default {
  name: "ImageLoader",
  props: {
    strapiImage: Object,
  },

  data() {
    return {
      getUrl,
      observer: null,
    };
  },

  mounted() {
    this.observer = new IntersectionObserver((entries) => {
      if (entries[0].intersectionRatio > 0) {
        this.$refs.image.src = this.$refs.image.dataset.src;
        this.$refs.image.srcset = this.$refs.image.dataset.srcset;
        this.$refs.image.sizes = this.$refs.image.dataset.sizes;
        this.observer.unobserve(this.$refs.image);
      }
    });
    this.observer.observe(this.$refs.image);
  },

  computed: {
    getSrcset() {
      return this.strapiImage.map((image) => image.url).join(", ");
    },

    image() {
      const formats = Object.values(this.strapiImage.formats);
      return {
        alt: "",
        src: this.getUrl(this.strapiImage.url),
        srcset: formats.map((image) => `${this.getUrl(image.url)} ${image.width}w`).join(", "),
        sizes: "(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw",
        size: {
          height: this.strapiImage.height,
          width: this.strapiImage.width,
        },
      };
    },
  },
};
</script>

<style></style>
