import { GetTopicsItem } from '../../../../api/types';
import BottomSheetDialog from './BottomSheetDialog';

@Observed
export class CardItemData implements GetTopicsItem {
  "id": string
  "author_id": string
  "tab": string
  "content": string
  "title": string
  "last_reply_at": string
  "good": boolean
  "top": boolean
  "reply_count": number
  "visit_count": number
  "create_at": string
  "author": {
    "loginname": string,
    "avatar_url": string
  }

  constructor(data: GetTopicsItem) {
    this.id = data.id
    this.author_id = data.author_id
    this.tab = data.tab
    this.content = data.content
    this.title = data.title
    this.last_reply_at = data.last_reply_at
    this.good = data.good
    this.top = data.top
    this.reply_count = data.reply_count
    this.visit_count = data.visit_count
    this.create_at = data.create_at
    this.author = data.author
  }
}

const tabLabelMap = {
  ask: '问答',
  share: '分享',
  job: '工作',
  good: '精品'
}


@Component
struct CardItem {
  @ObjectLink item: CardItemData;
  dialogController: CustomDialogController | null

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Column() {
        Text(this.item.title)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Row() {
          Image(this.item.author.avatar_url)
            .width(20)
            .height(20)
          Text(this.item.author.loginname)
            .fontSize(12)
            .margin({ left: 10 })
        }
        .justifyContent(FlexAlign.Start)
        .width('100%')
        .margin({ top: 4, bottom: 4 })

        Text(this.item.content)
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
              Text(`${this.item.visit_count}`)
                .fontSize(12)
                .margin({ left: 4 })
            }
            .alignItems(VerticalAlign.Center)

            Row() {
              Image($r('app.media.reply'))
                .width(18)
                .height(18)
              Text(`${this.item.reply_count}`)
                .fontSize(12)
                .margin({ left: 4 })
            }
            .margin({ left: 20 })
            .alignItems(VerticalAlign.Center)
          }

          Row() {
            Text(tabLabelMap[this.item.tab] ?? '未知')
              .backgroundColor('#e5e5e5')
              .padding({ top: 4, bottom: 4, left: 6, right: 6 })
              .fontColor('#999')
            Image($r('app.media.ellipsis'))
              .width(18)
              .height(18)
              .margin({ left: 16 })
              .onClick(() => {
                this.openDialog()
              })
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

      if (this.item.top) {
        Row() {
        }
        .width(0)
        .height(0)
        .borderWidth(16)
        .borderStyle(BorderStyle.Solid)
        .borderColor({
          top: '#80bd01',
          left: Color.Transparent,
          bottom: Color.Transparent,
          right: '#80bd01'
        })

        Text('置顶')
          .fontSize(10)
          .fontColor(Color.White)
          .margin({ top: 4 })
          .rotate({ angle: 45 })
      }

    }
    .width('100%')
  }

  // 打开底部弹框
  openDialog() {
    this.dialogController?.close();
    this.dialogController = new CustomDialogController({
      builder: BottomSheetDialog({
        item: this.item
      }),
      alignment: DialogAlignment.Bottom,
      customStyle: true
    })
    this.dialogController.open()
  }

  aboutToDisappear() {
    this.dialogController?.close();
  }
}

export default CardItem