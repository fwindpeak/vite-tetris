import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path';



// https://vitejs.dev/config/
export default defineConfig({
  base: './',
  plugins: [
    react()],
  resolve: {
    alias: {
      // 设置 `@` 指向 `src` 目录的绝对路径
      // eslint-disable-next-line no-undef
      '@': resolve(__dirname, './src')
    }
  },
  build: {
    rollupOptions: {
      external: [],
      // ...其他 rollup 配置
    },
  }
})
