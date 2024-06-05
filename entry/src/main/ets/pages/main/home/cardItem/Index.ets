import { GetTopicsItem } from '../../../../api/types';
import BottomSheetDialog from './BottomSheetDialog';
import dayjs from 'dayjs'
import { YYYYMMDDHHMM } from '../../../../services/const';

const tabLabelMap = {
  ask: '问答',
  share: '分享',
  job: '工作',
  good: '精品'
}


@Component
struct CardItem {
  @State item: GetTopicsItem = null;
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
          Row() {
            Image(this.item.author.avatar_url)
              .width(20)
              .height(20)
            Text(this.item.author.loginname)
              .fontSize(12)
              .margin({ left: 10 })
              .layoutWeight(1)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .justifyContent(FlexAlign.Start)
          .layoutWeight(1)
          .padding({ right: 10 })

          Text(`发表于：${dayjs(this.item.create_at).format(YYYYMMDDHHMM)}`).fontSize(12)
        }
        .margin({ top: 4, bottom: 4 })
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)


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
          top: $r('app.color.success_color'),
          left: Color.Transparent,
          bottom: Color.Transparent,
          right: $r('app.color.success_color')
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