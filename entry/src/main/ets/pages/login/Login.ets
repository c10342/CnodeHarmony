@Entry
@Component
struct Login {
  build() {
    Column() {
      Column() {
        Image($r('app.media.cnodejs_light'))
          .width('100%')
          .height(100)
        TextInput({ placeholder: '请输入token' })
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

  onLogin() {
    // todo
  }
}