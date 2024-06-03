@Component
struct CardContent {
  @Prop tab: string;

  @Builder BuildItem() {
    Column() {
      Text('Electron收银台')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Row() {
        Image($r('app.media.chat'))
          .width(20)
          .height(20)
        Text('前端小腹')
          .fontSize(12)
          .margin({ left: 10 })
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .margin({ top: 4, bottom: 4 })

      Text('掐阿打算打算打算打算大萨达打打分三大发沙发沙发掐阿打算打算打算打算大萨达打打分三大发沙发沙发掐阿打算打算打算打算大萨达打打分三大发沙发沙发')
        .maxLines(2)
        .fontSize(14)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .lineHeight(24)
      Row() {
        Row() {
          Row() {
            Image($r('app.media.visit'))
              .width(18)
              .height(18)
            Text('21')
              .fontSize(12)
              .margin({ left: 4 })
          }
          .alignItems(VerticalAlign.Center)

          Row() {
            Image($r('app.media.reply'))
              .width(18)
              .height(18)
            Text('11')
              .fontSize(12)
              .margin({ left: 4 })
          }
          .margin({ left: 20 })
          .alignItems(VerticalAlign.Center)
        }

        Row() {
          Text('前端')
            .backgroundColor('#e5e5e5')
            .padding({ top: 4, bottom: 4, left: 6, right: 6 })
            .fontColor('#999')
          Image($r('app.media.ellipsis'))
            .width(18)
            .height(18)
            .margin({ left: 16 })
        }
      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 6 })
      .width('100%')
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding(10)
    .backgroundColor('#fff')
    .margin({ top: 10 })
  }

  build() {
    List() {
      ListItem() {
        this.BuildItem()
      }
    }
    .height('100%')
    .backgroundColor('#eee')
  }

  aboutToAppear() {
    // todo
  }
}

export default CardContent;