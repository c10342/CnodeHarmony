import axios, { AxiosInstance, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'

class Request {
  private instance: AxiosInstance;

  constructor() {
    this.instance = axios.create({
      baseURL: 'https://cnodejs.org/api/v1'
    })
    this.initInterceptors()
  }

  private initInterceptors() {
    this.instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
      // 对请求数据做点什么
      return config;
    })
    // 添加响应拦截器
    axios.interceptors.response.use((response:AxiosResponse)=> {
      // 对响应数据做点什么
      return response;
    });
  }

  get(url: string, params?: Record<string, any>) {
    return this.instance.get(url, {
      params
    })
  }

  post(url: string, params?: Record<string, any>) {
    return this.instance.post(url, params)
  }
}

const request = new Request();

export default request