import { getTopics } from '../../../api';
import { GetTopicsItem } from '../../../api/types';
import { CommonDataSource } from '../../../services/lazyForEach';
import Log from '../../../services/log';

const tabLabelMap = {
  ask: '问答',
  share: '分享',
  job: '工作',
  good: '精品'
}

@Component
struct CardContent {
  @Prop tab: string;
  // @State list: GetTopicsItem[] = []

  private list: CommonDataSource<GetTopicsItem> = new CommonDataSource<GetTopicsItem>()

  @Builder BuildItem(item: GetTopicsItem) {
    Column() {
      Text(item.title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Row() {
        Image(item.author.avatar_url)
          .width(20)
          .height(20)
        Text(item.author.loginname)
          .fontSize(12)
          .margin({ left: 10 })
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .margin({ top: 4, bottom: 4 })

      Text(item.content)
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
            Text(`${item.visit_count}`)
              .fontSize(12)
              .margin({ left: 4 })
          }
          .alignItems(VerticalAlign.Center)

          Row() {
            Image($r('app.media.reply'))
              .width(18)
              .height(18)
            Text(`${item.reply_count}`)
              .fontSize(12)
              .margin({ left: 4 })
          }
          .margin({ left: 20 })
          .alignItems(VerticalAlign.Center)
        }

        Row() {
          Text(tabLabelMap[item.tab] ?? '未知')
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
  }

  build() {
    Column() {
      List({ space: 10 }) {
        LazyForEach(this.list, (item: GetTopicsItem) => {
          ListItem() {
            this.BuildItem(item)
          }
        }, (item: GetTopicsItem) => item.id)
      }
    }
    .width('100%')
    .height('100%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#eee')
  }

  async getList() {
    try {
      const res = await getTopics({
        page: 1,
        tab: this.tab,
        limit: 10,
        mdrender: false
      })
      if (res.success) {
        res.data.forEach(item => {
          this.list.pushData(item)
        })
      }
    } catch (e) {
      Log.error(e)
    }
  }

  aboutToAppear() {
    this.getList()
  }
}

export default CardContent;