import Home from './home/Index';
import My from './my/Index';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;

  @Builder TabBuilder(label: string, url: string | PixelMap | Resource, activeUrl: string | PixelMap | Resource, index: number) {
    Column() {
      Image(this.currentIndex === index ? activeUrl : url)
        .width(26)
        .height(26)
      Text(label)
        .margin({ top: 4 })
        .fontColor(this.currentIndex === index ? $r('app.color.main_color') : Color.Black)
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .layoutWeight(1)
    .width('100%')
    .onClick(() => {
      this.currentIndex = index
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentIndex }) {
      TabContent() {
        Home()
      }.tabBar(this.TabBuilder('首页', $r('app.media.home'), $r('app.media.home_active'), 0))

      TabContent() {
        My()
      }.tabBar(this.TabBuilder('我的', $r('app.media.my'), $r('app.media.my_active'), 1))
    }
    .height('100%')
    .scrollable(false)
    .onChange(index => {
      this.currentIndex = index
    })
  }
}