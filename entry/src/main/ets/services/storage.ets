import { UserInfoData } from '../types/common';
import Log from './log';

class Storage {
  // 必须在使用前进行初始化
  static init() {
    PersistentStorage.PersistProp('token', '')
  }

  static get<T = any>(key: string, defaultValue?: T) {
    return AppStorage.Get<T>(key) ?? defaultValue
  }
  // 属性值，不能为undefined或null。
  static set(key: string, value: any) {
    AppStorage.SetOrCreate(key, value);
  }

  static delete(key: string) {
    return AppStorage.Delete(key)
  }

  // 设置token
  static setToken(token: string) {
    this.set('token', token)
  }
  // 获取token
  static getToken(): string {
    return this.get('token', '')
  }
  // 设置用户信息
  static setUserInfo(userInfo: UserInfoData) {
    this.set('userInfo', userInfo)
  }
  // 获取用户信息
  static getUserInfo(): UserInfoData {
    return this.get('userInfo', '')
  }
}

export default Storage