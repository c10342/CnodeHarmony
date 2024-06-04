import request from '../services/request'
import { GetTopicsParams, GetTopicsRespond } from './types'
// 获取主题列表
export const getTopics = (params: GetTopicsParams) => request.get<GetTopicsRespond>('/topics', params)