import promptAction from '@ohos.promptAction'

export class GlobalUI {
  static showToast(message: string) {
    promptAction.showToast({
      message: message
    })
  }
}