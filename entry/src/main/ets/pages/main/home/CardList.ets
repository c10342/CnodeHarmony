import { getTopics } from '../../../api';
import { CommonDataSource } from '../../../services/lazyForEach';
import Log from '../../../services/log';
import CardItem, { CardItemData } from './cardItem/Index';


@Component
struct CardList {
  @Prop tab: string;
  private list: CommonDataSource<CardItemData> = new CommonDataSource<CardItemData>()

  build() {
    Column() {
      List({ space: 10 }) {
        LazyForEach(this.list, (item: CardItemData) => {
          ListItem() {
            CardItem({ item: item })
          }
        }, (item: CardItemData) => item.id)
      }
    }
    .width('100%')
    .height('100%')
    .padding({ top: 10, bottom: 10 })
    .backgroundColor('#eee')
  }

  async getList() {
    try {
      const res = await getTopics({
        page: 1,
        tab: this.tab,
        limit: 10,
        mdrender: false
      })
      if (res.success) {
        res.data.forEach(item => {
          this.list.pushData(new CardItemData(item))
        })
      }
    } catch (e) {
      Log.error(e)
    }
  }

  aboutToAppear() {
    this.getList()
  }
}

export default CardList;