@Component
export default struct Item {
  private content?: string;
  @State isComplete: boolean = false;

  @Builder
  labelIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width(28)
      .height(28)
      .margin(20)
  }

  build() {
    Row() {
      if (this.isComplete) {
        // 图标路径 entry/src/main/resources/base/media/ic_ok.png
        this.labelIcon($r('app.media.ic_ok'));
      } else {
        // 图标路径 entry/src/main/resources/base/media/ic_default.png
        this.labelIcon($r('app.media.ic_default'));
      }
      Text(this.content)
        .fontSize(20)
        .fontWeight(500)
        .opacity(this.isComplete ? 0.4 : 1.0)
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .borderRadius(12)
    .backgroundColor("#FFFFFF")
    .width("100%")
    .height("64vp")
    .onClick(() => {
      this.isComplete = !this.isComplete;
    })
  }
}
