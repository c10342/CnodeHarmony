
import { GetTopicsItem } from '../../../../api/types';
interface ItemData {
  label: string,
  imageUrl: string | PixelMap | Resource
}

@CustomDialog
struct BottomSheetDialog {
  item: GetTopicsItem;
  controller: CustomDialogController
  @State list: Array<ItemData> = []

  aboutToAppear() {
    this.list = [
      { label: '不感兴趣', imageUrl: $r('app.media.sad') },
      {
        label: `屏蔽作者：${this.item?.author?.loginname}`,
        imageUrl: $r('app.media.my')
      },
      {
        label: '屏蔽标签', imageUrl: $r('app.media.shielding')
      },
      {
        label: '举报', imageUrl: $r('app.media.report')
      }
    ]
  }

  build() {
    List() {
      ForEach(this.list, (item: ItemData) => {
        ListItem() {
          Row() {
            Image(item.imageUrl)
              .width(20)
              .height(20)
              .margin({ right: 10 })
            Text(item.label)
              .fontSize(16)
          }
          .height(50)
          .alignItems(VerticalAlign.Center)
          .padding({ left: 16, right: 16 })
          .onClick(() => {
            this.controller?.close();
          })
        }
      })
    }
    .divider({
      strokeWidth: 1,
      color: '#ffe9f0f0'
    })
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius({
      topLeft: 10,
      topRight: 10
    })
  }
}

export default BottomSheetDialog