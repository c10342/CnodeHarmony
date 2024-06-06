import router from '@ohos.router'
import { login } from '../../api'
import Storage from '../../services/storage'
import { GlobalUI } from '../../services/ui'

@Entry
@Component
struct Login {
  // 54033715-3491-410e-a95e-567516aab280
  @State token: string = '54033715-3491-410e-a95e-567516aab280'

  build() {
    Column() {
      Column() {
        Image($r('app.media.cnodejs_light'))
          .width('100%')
          .height(100)
        TextInput({ placeholder: '请输入token', text: this.token })
          .onChange(v => this.token = v)
          .backgroundColor('#eee')
          .margin({ top: 30 })
        Button('登录')
          .width('100%')
          .margin({ top: 30 })
          .backgroundColor(Color.Transparent)
          .borderWidth(1)
          .borderColor($r('app.color.success_color'))
          .borderStyle(BorderStyle.Solid)
          .fontColor($r('app.color.success_color'))
          .onClick(this.onLogin.bind(this))
      }
      .width('80%')
      .margin({ top: 200 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#444')
    .alignItems(HorizontalAlign.Center)
  }

  async onLogin() {
    if (!this.token) {
      GlobalUI.showToast('token不能为空')
      return
    }
    const res = await login(this.token)
    if (res.success) {
      Storage.setToken(this.token)
      Storage.setUserInfo({
        loginname: res.loginname,
        id: res.id,
        avatar_url: res.avatar_url
      })
      router.back();
    }
  }
}