import CardList from './CardList'

@Component
struct Home {
  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.add"), content: "发表" })
    }
  }

  @Builder
  BuilderHeader() {
    Row() {
      Row() {
        Image($r('app.media.search'))
          .width(20)
          .height(20)
          .margin({ left: 5 })
        Text('搜索cnode')
          .fontSize(14)
          .margin({ left: 5 })
      }
      .backgroundColor('#eee')
      .borderRadius(4)
      .layoutWeight(1)
      .height(32)
      .margin({ right: 10 })
      .alignItems(VerticalAlign.Center)

      Image($r('app.media.add'))
        .width(26)
        .height(26)
        .bindMenu(this.MenuBuilder)

    }
    .width('100%')
    .padding(10)
    .alignItems(VerticalAlign.Center)
  }
  // ask share job good
  @Builder
  BuilderTab() {
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