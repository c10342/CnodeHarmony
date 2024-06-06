import { UserInfoData } from '../../../types/common'
import router from '@ohos.router'
import { PageUrlEnum } from '../../../services/enums'

interface ListItem {
  label: string
  imageUrl: Resource,
  action?: () => any
}

@Preview
@Component
struct My {
  @StorageLink('userInfo') userInfo: UserInfoData = null

  @Builder ItemBuilder(item: ListItem) {
    Row() {
      Row() {
        Image(item.imageUrl)
          .width(20)
          .height(20)
          .borderRadius(10)
        Text(item.label)
          .fontSize(16)
          .fontColor(Color.Black)
          .margin({ left: 10 })
      }

      Image($r('app.media.right_arrow'))
        .width(20)
        .height(20)
    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding(10)
    .height(60)
    .border({
      width: { bottom: 1 },
      color: '#ccc',
      style: BorderStyle.Solid
    })
    .onClick(() => {
      item.action?.()
    })
  }

  build() {
    Column() {
      Column() {
        Image(this.userInfo ? this.userInfo.avatar_url : $r('app.media.avator'))
          .width(60)
          .height(60)
        if (this.userInfo) {
          Text(this.userInfo.loginname)
            .fontColor(Color.White)
            .fontSize(20)
            .margin({ top: 20 })
        } else {
          Text('登录')
            .fontColor(Color.White)
            .fontSize(20)
            .margin({ top: 20 })
            .onClick(this.onLogin.bind(this))
        }
      }
      .width('100%')
      .height(200)
      .backgroundColor('#444')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)

      List() {
        ListItem() {
          this.ItemBuilder({
            label: '关于', imageUrl: $r('app.media.about')
          })
        }

        if (this.userInfo) {
          ListItem() {
            this.ItemBuilder({ label: '退出登录', imageUrl: $r('app.media.logout') })
          }
        } else {
          ListItem() {
            this.ItemBuilder(
              { label: '登录',
                imageUrl: $r('app.media.logout'),
                action: this.onLogin.bind(this) })
          }
        }
      }
      .layoutWeight(1)
      .width('100%')
    }
    .height('100%')
  }

  onLogin() {
    router.pushUrl({
      url: PageUrlEnum.Login
    })
  }
}

export default My