@Component
struct BaseEmpty {
  build() {
    Column() {
      Image($r('app.media.empty'))
        .width('50%')
      Text('暂无数据')
        .fontSize(26)
        .fontColor(Color.Black)
    }
  }
}

export default BaseEmpty