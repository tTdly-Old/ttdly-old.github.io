import fs from 'fs-extra';
import parseFrontmatter from 'gray-matter';
import path from 'path'
const basePath = path.resolve("./pages/").toString().replace(/\\/g,"\/");
export default{
  watch: ['../../../pages/posts/*.md'],
  load(watchedFiles) {
    const res = watchedFiles.map(file => {
      const content = fs.readFileSync(file, 'utf-8')
      const herf = file.toString().replace(basePath,"").replace(".md",".html")
      const { data, excerpt } = parseFrontmatter(content)
      return {
        file:herf,
        data,
        excerpt
      }
    })
    return {
      data: res
    }
  }
}
