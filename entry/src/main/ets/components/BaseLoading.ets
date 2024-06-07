@Component
struct BaseLoading {
  build() {
    LoadingProgress()
      .color(Color.Blue)
      .size({ width: 200, height: 200 })
  }
}

export default BaseLoading