import Storage from '../../../services/storage'
import { UserInfoData } from '../../../types/common'

@Component
struct My {
  @StorageLink('userInfo') userInfo: UserInfoData = null

  build() {
    Column() {
      Text('我的')
      Text(this.userInfo ? this.userInfo.name : '--')
      Button('设置用户信息')
        .onClick(() => {
          Storage.setUserInfo({
            name: '张三'
          })
        })
    }
  }
}

export default My