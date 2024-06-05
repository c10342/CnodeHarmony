export interface BaseRespond {
  success: boolean
  data: any
  error_msg?: string
}

// 主题列表
export interface GetTopicsParams {
  // 页数
  page?: number
  // 主题分类。目前有 ask share job good
  tab?: string
  // 每一页的主题数量
  limit?: number
  // 当为 false 时，不渲染。默认为 true，渲染出现的所有 markdown 格式文本。
  mdrender?: boolean
}

export interface GetTopicsItem {
  "id": string,
  "author_id": string,
  "tab": string,
  "content": string
  "title": string
  "last_reply_at": string
  "good": boolean,
  "top": boolean,
  "reply_count": number,
  "visit_count": number,
  "create_at": string,
  "author": {
    "loginname": string,
    "avatar_url": string
  }
}

export interface GetTopicsRespond extends BaseRespond {
  data: GetTopicsItem[]
}