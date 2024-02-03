import { HelloComponent } from '../ui/HelloComponent'
// 引入其他组件
import Item from '../ui/Item'

@Entry
@Component
struct Index {
  // 当前文本输入框输入的文字
  @State todo: string = '';
  // 整个列表的状态数据
  @State list: Array<string> = [
    "学习鸿蒙开发",
    "沟通外包",
    "看剧放松"
  ];
  build() {
      // Flex 布局，纵向
      Flex({ direction: FlexDirection.Column, }) {
        // 增加一个标题文本
        Text("待办事项")// .border({ width: 1 })
          .width("100%")
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .margin({ bottom: 20 })

        // 文本输入框，用于添加新待办事项
        TextInput({ text: this.todo, placeholder: "请输入" })
          .width("100%")
          .height(45)
          .enterKeyType(EnterKeyType.Done)
          .placeholderColor(Color.Gray)
          .margin({ bottom: 20 })
          .onChange((value) => {
            // 文字修改则更新状态，并绑定状态，使之变为受控组件
            this.todo = value;
          })
          .onSubmit((value) => {
            // 回车时触发，填进列表
            console.log(String(value))
            this.list.push(this.todo)
            this.todo = ''
          })
        // 列表组件, 内部要使用 ForEach 渲染 ListItem 项
        List({ space: 20 }) {
          ForEach(this.list, (item: string) => {
            ListItem() {
              // ListItem 中包装了自定义组件 Item，见 ui/Item.ets
              Item({ content: item })
            }.width('100%')
          }, (item: string, i) => i + item)
        }
        .flexGrow(1)
        // 列表拖拽默认会有弹性特效，取消掉
        .edgeEffect(EdgeEffect.None)
      }
      .padding(18)
      .width('100%')
      .height('100%')
      .backgroundColor('#dddddd')
    }
}