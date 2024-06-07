import request from '../services/request'
import Storage from '../services/storage'
import { GetArticleDetailParams, GetArticleDetailRespond, GetTopicsParams, GetTopicsRespond, LoginRespond } from './types'
// 获取主题列表
export const getTopics = (params: GetTopicsParams) => request.get<GetTopicsRespond>('/topics', params)

// 登录
export const login = (accesstoken: string) => request.post<LoginRespond>('/accesstoken', { accesstoken })

// 获取文章详情 /api/v1/topic/5433d5e4e737cbe96dcef312
export const getArticleDetail = (params: GetArticleDetailParams) => request.get<GetArticleDetailRespond>(`/topic/${params.id}`, {
  mdrender: params.mdrender,
  accesstoken: Storage.getToken()
})