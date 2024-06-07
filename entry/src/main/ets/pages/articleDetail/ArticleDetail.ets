import { getArticleDetail } from '../../api'
import { GetArticleDetailData } from '../../api/types'
import BaseEmpty from '../../components/BaseEmpty'
import dayjs from 'dayjs'
import { YYYYMMDDHHMM } from '../../services/const'

@Entry
@Component
struct ArticleDetail {
  @State detail: GetArticleDetailData | null = null

  build() {
    if (!this.detail) {
      Column() {
        BaseEmpty()
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    } else {
      Column() {
        Column() {
          Text(this.detail.title)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Row() {
            Image(this.detail.author.avatar_url || $r('app.media.avator'))
              .width(40)
              .height(40)
              .margin({ right: 10 })
              .borderRadius(20)
            Column() {
              Text(this.detail.author.loginname)
                .fontSize(12)
              Row() {
                Text(dayjs(this.detail.create_at).format(YYYYMMDDHHMM))
                  .fontSize(12)
                Row() {
                  Image($r('app.media.visit'))
                    .width(18)
                    .height(18)
                  Text(this.detail.visit_count + '')
                    .fontSize(12)
                    .margin({ left: 4 })
                }
                .alignItems(VerticalAlign.Center)
                .margin({ left: 10 })

                Row() {
                  Image($r('app.media.reply'))
                    .width(18)
                    .height(18)
                  Text(`${this.detail.reply_count}`)
                    .fontSize(12)
                    .margin({ left: 4 })
                }
                .margin({ left: 10 })
                .alignItems(VerticalAlign.Center)
              }
              .margin({ top: 5 })
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ top: 10 })

          Column() {
            RichText(this.detail.content)
              .width('100%')
              .height('100%')
              .backgroundColor(Color.White)
          }
          .width('100%')
          .layoutWeight(1)
          .margin({ top: 10 })
        }
        .padding(10)
        .layoutWeight(1)
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        Row() {

        }
        .height(50)
        .width('100%')
        .backgroundColor(Color.Red)
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Start)
    }

  }

  async aboutToAppear() {
    const res = await getArticleDetail({
      id: '5433d5e4e737cbe96dcef312'
    })
    if (res.success) {
      this.detail = res.data
    }
  }
}