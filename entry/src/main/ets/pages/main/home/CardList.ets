import { getTopics } from '../../../api';
import { CommonDataSource } from '../../../services/lazyForEach';
import Log from '../../../services/log';
import CardItem from './cardItem/Index';
import { GetTopicsItem } from '../../../api/types';
import BaseEmpty from '../../../components/BaseEmpty';
import BaseLoading from '../../../components/BaseLoading';


@Component
struct CardList {
  @Prop tab: string;
  @State list: CommonDataSource<GetTopicsItem> = new CommonDataSource<GetTopicsItem>()
  @State isEmpty: boolean = false
  @State loading: boolean = false

  build() {
    Column() {
      if (this.loading) {
        BaseLoading()
      } else if (this.isEmpty) {
        BaseEmpty()
      } else {
        List({ space: 10 }) {
          LazyForEach(this.list, (item: GetTopicsItem) => {
            ListItem() {
              CardItem({ item: item })
            }
          }, (item: GetTopicsItem) => item.id)
        }
      }
    }
    .width('100%')
    .height('100%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#eee')
  }

  async getList() {
    try {
      this.loading = true
      const res = await getTopics({
        page: 1,
        tab: this.tab,
        limit: 10,
        mdrender: false
      })
      if (res.success) {
        this.isEmpty = !res.data.length
        res.data.forEach(item => {
          this.list.pushData(item)
        })
      }
    } catch (e) {
      Log.error(e)
    } finally {
      this.loading = false
    }
  }

  aboutToAppear() {
    this.getList()
  }
}

export default CardList;