import router from '@ohos.router'

@Component
struct BaseBar {
  @Prop title: string;
  // 是否需要返回按钮
  @State hasBackBtn: boolean = false

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      if (this.hasBackBtn) {
        Image($r('app.media.left_arrow'))
          .width(30)
          .height(30)
          .zIndex(10)
          .margin({ top: 10, left: 10 })
          .onClick(() => router.back())
      }
      Row() {
        Text(this.title ?? '')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
      }
      .height('100%')
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height(50)
    .shadow({
      radius: 5,
      color: '#ccc'
    })
  }

  aboutToAppear() {
    // 获取当前在页面栈内的页面数量
    this.hasBackBtn = parseInt(router.getLength()) > 1
  }
}

export default BaseBar