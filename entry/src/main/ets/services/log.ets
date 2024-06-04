import hilog from '@ohos.hilog';

class Log {
  static info(message: any) {
    if (typeof message !== 'string') {
      message = JSON.stringify(message)
    }
    hilog.info(0x0000, 'testTag', '%{public}s', message);
  }

  static error(message: any) {
    if (typeof message !== 'string') {
      message = JSON.stringify(message)
    }
    hilog.error(0x0000, 'testTag', '%{public}s', message);
  }
}

export default Log