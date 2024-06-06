import router from '@ohos.router'
import { login } from '../../api'
import { PageUrlEnum } from '../../services/enums'
import Storage from '../../services/storage'

@Entry
@Component
struct Welcome {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }

  async aboutToAppear() {
    // 判断是否存在token
    // 存在则自动登录
    // 然后跳转到首页
    const token = Storage.getToken()
    if (token) {
      const res = await login(token)
      if (res.success) {
        Storage.setUserInfo({
          loginname: res.loginname,
          id: res.id,
          avatar_url: res.avatar_url
        })
      }
    }
    router.pushUrl({
      url: PageUrlEnum.Main
    })
  }
}