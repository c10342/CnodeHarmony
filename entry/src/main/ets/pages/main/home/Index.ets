import CardList from './CardList'

@Component
struct Home {
  @Builder BuilderHeader() {
    Row() {
      Row() {
        Text('搜索cnode')
          .fontSize(14)
          .margin({ left: 10 })
      }
      .backgroundColor('#eee')
      .borderRadius(4)
      .layoutWeight(1)
      .height(32)
      .margin({ right: 10 })

      Image($r('app.media.add'))
        .width(26)
        .height(26)
    }
    .width('100%')
    .padding(10)
    .alignItems(VerticalAlign.Center)
  }
  // ask share job good
  @Builder BuilderTab() {
    Tabs() {
      TabContent() {
        CardList({ tab: '' })
      }.tabBar('全部')

      TabContent() {
        CardList({ tab: 'ask' })
      }.tabBar('问答')

      TabContent() {
        CardList({ tab: 'share' })
      }.tabBar('分享')

      TabContent() {
        CardList({ tab: 'job' })
      }.tabBar('工作')

      TabContent() {
        CardList({ tab: 'good' })
      }.tabBar('精品')
    }
    .layoutWeight(1)
  }

  build() {
    Column() {
      this.BuilderHeader()
      this.BuilderTab()
    }
    .height('100%')
    .width('100%')
  }
}

export default Home