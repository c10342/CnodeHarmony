import request from '../services/request'
import { GetTopicsParams, GetTopicsRespond, LoginRespond } from './types'
// 获取主题列表
export const getTopics = (params: GetTopicsParams) => request.get<GetTopicsRespond>('/topics', params)

// 登录
export const login = (accesstoken:string)=>request.post<LoginRespond>('/accesstoken',{accesstoken})