import axios, { AxiosError, AxiosInstance, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'
import { GlobalUI } from './ui';

interface Options {
  baseURL?: string
  timeout?: number
}

class Request {
  private instance: AxiosInstance;
  private options?: Options;

  constructor(options?: Options) {
    this.options = options
    this.instance = axios.create({
      ...(this.options ??{})
    })
    this.initInterceptors()
  }

  private initInterceptors() {
    this.instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
      // 对请求数据做点什么
      return config;
    })
    // 添加响应拦截器
    this.instance.interceptors.response.use((response: AxiosResponse) => {
      // 对响应数据做点什么
      if (!response.data?.success) {
        GlobalUI.showToast(response.data?.error_msg ?? '请求错误')

      }
      return response.data;
    }, (error: AxiosError) => {
      // 对响应错误做点什么
      GlobalUI.showToast(error.message ?? '请求错误')
      return Promise.reject(error);
    });
  }

  get<T = any>(url: string, params?: Record<string, any>): Promise<T> {
    return this.instance.get(url, {
      params
    })
  }

  post<T = any>(url: string, params?: Record<string, any>): Promise<T> {
    return this.instance.post(url, params)
  }
}

const request = new Request({
  baseURL: 'https://cnodejs.org/api/v1',
  timeout: 10 * 1000
});

export default request